# CardDemo Frontend - Nx Monorepo

This is an Nx monorepo containing 5 Next.js applications for the CardDemo card management system.

## Quick Start

1. **Install dependencies:**
```bash
npm install
```

2. **Start all applications:**
```bash
npm run dev
```

3. **Access the applications:**
- Login: http://localhost:3000
- Accounts: http://localhost:3001
- Bill Payment: http://localhost:3002
- Card Management: http://localhost:3003
- Transactions: http://localhost:3004

## Applications

| Application      | Port | Description                          |
|-----------------|------|--------------------------------------|
| login           | 3000 | Authentication & menu system         |
| accounts        | 3001 | Account management                   |
| bill-payment    | 3002 | Payment processing                   |
| card-management | 3003 | Credit card operations               |
| transactions    | 3004 | Transaction history                  |

## Running Individual Apps

```bash
npm run dev:login              # Start only login app
npm run dev:accounts           # Start only accounts app
npm run dev:bill-payment       # Start only bill-payment app
npm run dev:card-management    # Start only card-management app
npm run dev:transactions       # Start only transactions app
```

## Documentation

- **[MONOREPO.md](./MONOREPO.md)** - Complete Nx monorepo guide with all commands
- **[archetype.md](./archetype.md)** - Architecture patterns and feature development guide
- **[.github/copilot-instructions.md](./.github/copilot-instructions.md)** - AI coding assistant guide

## Technology Stack

- **Nx 22.0.4** - Monorepo management
- **Next.js 15.5.3** - React framework with App Router
- **React 19.1.0** - UI library
- **TypeScript 5** - Type safety
- **TailwindCSS v4** - Styling
- **Turbopack** - Fast bundler

## Backend Integration

All applications proxy API requests to `http://localhost:8080/api/*`. Make sure the backend server is running before starting the frontend.

## Learn More

- [Nx Documentation](https://nx.dev) - Learn about Nx
- [Next.js Documentation](https://nextjs.org/docs) - Learn about Next.js features
- [React Documentation](https://react.dev) - Learn React
