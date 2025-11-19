# CardDemo Frontend - Nx Monorepo

This is an Nx monorepo containing 5 Next.js applications for the CardDemo card management system.

## Applications

Each application runs on its own port in development mode:

| Application      | Port | Description                          |
|-----------------|------|--------------------------------------|
| login           | 3000 | Authentication & menu system         |
| accounts        | 3001 | Account management                   |
| bill-payment    | 3002 | Payment processing                   |
| card-management | 3003 | Credit card operations               |
| transactions    | 3004 | Transaction history                  |

## Running Applications

### Run All Applications Together

Development mode (with Turbopack):
```bash
npm run dev
```

Production mode:
```bash
npm run build
npm run start
```

### Run Individual Applications

#### Development Mode

```bash
npm run dev:login            # Start login app on port 3000
npm run dev:accounts         # Start accounts app on port 3001
npm run dev:bill-payment     # Start bill-payment app on port 3002
npm run dev:card-management  # Start card-management app on port 3003
npm run dev:transactions     # Start transactions app on port 3004
```

Or using Nx directly:
```bash
nx dev login
nx dev accounts
nx dev bill-payment
nx dev card-management
nx dev transactions
```

#### Build Individual Applications

```bash
npm run build:login
npm run build:accounts
npm run build:bill-payment
npm run build:card-management
npm run build:transactions
```

Or using Nx directly:
```bash
nx build login
nx build accounts
nx build bill-payment
nx build card-management
nx build transactions
```

#### Start Individual Applications (Production)

```bash
npm run start:login
npm run start:accounts
npm run start:bill-payment
npm run start:card-management
npm run start:transactions
```

Or using Nx directly:
```bash
nx start login
nx start accounts
nx start bill-payment
nx start card-management
nx start transactions
```

## Nx Commands

### View Project Graph
```bash
nx graph
```

### Run Specific Targets
```bash
nx run <project>:<target>
```

Examples:
```bash
nx run login:dev
nx run accounts:build
nx run transactions:lint
```

### Run Multiple Projects
```bash
# Run dev on specific projects
nx run-many -t dev --projects=login,accounts

# Run build on all projects
nx run-many -t build --all

# Run with parallel execution
nx run-many -t dev --all --parallel=5
```

## Project Structure

```
frontend/
├── apps/
│   ├── login/              # Port 3000
│   │   ├── app/           # Next.js pages & API routes
│   │   ├── components/    # React components
│   │   ├── contexts/      # React contexts
│   │   ├── lib/           # Utilities & middleware
│   │   ├── services/      # API services
│   │   ├── types/         # TypeScript types
│   │   ├── next.config.ts
│   │   ├── project.json   # Nx project config
│   │   └── tsconfig.json
│   ├── accounts/          # Port 3001
│   ├── bill-payment/      # Port 3002
│   ├── card-management/   # Port 3003
│   └── transactions/      # Port 3004
├── src/                   # Archetype template (reference)
├── nx.json               # Nx workspace config
├── package.json          # Scripts & dependencies
└── tsconfig.json         # Root TypeScript config
```

## Backend Integration

All applications proxy API requests to the backend server:
- **Backend URL**: `http://localhost:8080`
- **API Prefix**: `/api/*`

Make sure the backend server is running on port 8080 before starting the frontend applications.

## Development Workflow

1. **Start the backend server** (port 8080)
2. **Start frontend apps**:
   - All together: `npm run dev`
   - Individual: `npm run dev:login`, etc.
3. **Access applications**:
   - Login: http://localhost:3000
   - Accounts: http://localhost:3001
   - Bill Payment: http://localhost:3002
   - Card Management: http://localhost:3003
   - Transactions: http://localhost:3004

## Technology Stack

- **Nx**: 22.0.4 - Monorepo management
- **Next.js**: 15.5.3 - React framework
- **React**: 19.1.0 - UI library
- **TypeScript**: 5 - Type safety
- **TailwindCSS**: v4 - Styling
- **Turbopack**: Fast bundler

## Useful Nx Commands

```bash
# Show all projects
nx show projects

# Show project details
nx show project login

# Clear cache
nx reset

# Run affected projects only
nx affected -t build
nx affected -t test

# Lint all projects
npm run lint
```

## Notes

- Each app is **independent** with its own dependencies and configuration
- Shared code is **duplicated** across apps (not using shared libraries)
- Each app can be built and deployed separately
- All apps use the same backend API (`http://localhost:8080`)
