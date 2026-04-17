# Stage 1: Install dependencies
FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci

# Stage 2: Build all apps
FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Ensure public directories exist for all sub-apps
RUN mkdir -p apps/login/public apps/accounts/public apps/bill-payment/public apps/card-management/public apps/transactions/public && \
    touch apps/login/public/.gitkeep apps/accounts/public/.gitkeep apps/bill-payment/public/.gitkeep apps/card-management/public/.gitkeep apps/transactions/public/.gitkeep

# Build sub-apps first, then dashboard
ENV NX_DAEMON=false
ENV NEXT_TELEMETRY_DISABLED=1
RUN npx nx run-many -t build --projects=login,accounts,bill-payment,card-management,transactions --parallel=3
RUN npx nx run card-demo:build:production

# Stage 3: Production runtime
FROM node:20-alpine AS runner
WORKDIR /app

RUN apk add --no-cache nginx supervisor

ENV NODE_ENV=production

# Create app user
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 nextjs

# Copy standalone outputs for each app
COPY --from=builder /app/.next/standalone ./dashboard
COPY --from=builder /app/.next/static ./dashboard/.next/static
COPY --from=builder /app/public ./dashboard/public

COPY --from=builder /app/apps/login/.next/standalone ./login
COPY --from=builder /app/apps/login/.next/static ./login/apps/login/.next/static

COPY --from=builder /app/apps/accounts/.next/standalone ./accounts
COPY --from=builder /app/apps/accounts/.next/static ./accounts/apps/accounts/.next/static

COPY --from=builder /app/apps/bill-payment/.next/standalone ./bill-payment
COPY --from=builder /app/apps/bill-payment/.next/static ./bill-payment/apps/bill-payment/.next/static

COPY --from=builder /app/apps/card-management/.next/standalone ./card-management
COPY --from=builder /app/apps/card-management/.next/static ./card-management/apps/card-management/.next/static

COPY --from=builder /app/apps/transactions/.next/standalone ./transactions
COPY --from=builder /app/apps/transactions/.next/static ./transactions/apps/transactions/.next/static

# Copy nginx and supervisor configs
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

# Create nginx directories
RUN mkdir -p /var/log/nginx /var/lib/nginx/tmp /run/nginx

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
