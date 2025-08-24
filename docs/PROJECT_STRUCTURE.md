# IT-DMS Project Structure

## Overview

This document outlines the complete project structure for the IT Department Management System (IT-DMS).

## Directory Structure

```
it-desk/
├── src/                          # Source code
│   ├── app/                      # Next.js App Router
│   │   ├── (auth)/              # Authentication routes (grouped)
│   │   │   ├── login/
│   │   │   ├── register/
│   │   │   └── forgot-password/
│   │   ├── dashboard/           # Main dashboard
│   │   ├── assets/              # Asset management
│   │   │   ├── devices/
│   │   │   ├── inventory/
│   │   │   └── movements/
│   │   ├── requisitions/        # Purchase requisitions
│   │   ├── maintenance/         # Maintenance scheduling
│   │   ├── incidents/           # Incident management
│   │   ├── employees/           # Employee profiles
│   │   ├── vendors/             # Vendor management
│   │   ├── reports/             # Analytics and reports
│   │   ├── settings/            # System settings
│   │   ├── knowledge/           # Knowledge management
│   │   ├── financial/           # Financial management
│   │   ├── scheduling/          # Resource scheduling
│   │   ├── globals.css          # Global styles
│   │   ├── layout.tsx           # Root layout
│   │   └── page.tsx             # Home page
│   ├── components/              # Reusable UI components
│   │   ├── ui/                  # Base UI components
│   │   │   ├── Button.tsx
│   │   │   ├── Input.tsx
│   │   │   ├── Modal.tsx
│   │   │   ├── Table.tsx
│   │   │   └── ...
│   │   ├── forms/               # Form components
│   │   ├── layout/              # Layout components
│   │   │   ├── Sidebar.tsx
│   │   │   ├── Header.tsx
│   │   │   └── Footer.tsx
│   │   ├── dashboard/           # Dashboard components
│   │   ├── assets/              # Asset-related components
│   │   ├── requisitions/        # Requisition components
│   │   └── ...
│   ├── lib/                     # Utilities and configurations
│   │   ├── supabase.ts          # Supabase client
│   │   ├── auth.ts              # Authentication utilities
│   │   ├── api.ts               # API utilities
│   │   ├── utils.ts             # General utilities
│   │   └── constants.ts         # Application constants
│   ├── types/                   # TypeScript definitions
│   │   ├── supabase.ts          # Generated Supabase types
│   │   ├── api.ts               # API types
│   │   ├── components.ts        # Component prop types
│   │   └── index.ts             # Type exports
│   ├── hooks/                   # Custom React hooks
│   │   ├── useAuth.ts
│   │   ├── useSupabase.ts
│   │   ├── useAssets.ts
│   │   └── ...
│   ├── utils/                   # Utility functions
│   │   ├── date.ts
│   │   ├── format.ts
│   │   ├── validation.ts
│   │   └── ...
│   ├── styles/                  # Additional styles
│   └── constants/               # Application constants
├── supabase/                    # Database and Supabase config
│   ├── migrations/              # Database migrations
│   ├── seed.sql                 # Seed data
│   └── config.toml              # Supabase configuration
├── docs/                        # Documentation
│   ├── API.md                   # API documentation
│   ├── DEPLOYMENT.md            # Deployment guide
│   ├── CONTRIBUTING.md          # Contributing guidelines
│   └── ...
├── scripts/                     # Automation scripts
│   ├── setup.sh                 # Project setup script
│   ├── deploy.sh                # Deployment script
│   └── ...
├── public/                      # Static assets
│   ├── images/
│   ├── icons/
│   └── ...
├── tests/                       # Test files
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── .github/                     # GitHub workflows
│   └── workflows/
├── package.json                 # Dependencies and scripts
├── next.config.js              # Next.js configuration
├── tailwind.config.js          # Tailwind CSS configuration
├── tsconfig.json               # TypeScript configuration
├── postcss.config.js           # PostCSS configuration
├── .env.example                # Environment variables template
├── .gitignore                  # Git ignore rules
├── README.md                   # Project documentation
└── LICENSE                     # MIT License
```

## Key Files and Their Purposes

### Configuration Files
- `package.json` - Project dependencies and scripts
- `next.config.js` - Next.js framework configuration
- `tailwind.config.js` - Tailwind CSS styling configuration
- `tsconfig.json` - TypeScript compiler configuration
- `postcss.config.js` - CSS processing configuration

### Environment Files
- `.env.example` - Template for environment variables
- `.env.local` - Local environment variables (not committed)

### Documentation
- `README.md` - Main project documentation
- `docs/` - Detailed documentation
- `LICENSE` - MIT license

### Source Code Organization

#### App Router (`src/app/`)
- Uses Next.js 13+ App Router
- File-based routing
- Grouped routes for better organization
- Layout components for consistent UI

#### Components (`src/components/`)
- Reusable UI components
- Organized by feature/domain
- Base UI components in `ui/` folder
- Form components in `forms/` folder

#### Utilities (`src/lib/` and `src/utils/`)
- Database connections
- Authentication utilities
- API helpers
- General utility functions

#### Types (`src/types/`)
- TypeScript type definitions
- Generated types from Supabase
- Component prop types
- API response types

#### Hooks (`src/hooks/`)
- Custom React hooks
- Data fetching hooks
- State management hooks
- Authentication hooks

## Database Structure

### Core Tables
- `employees` - Employee information
- `devices` - Hardware and software assets
- `vendors` - Vendor information
- `requisitions` - Purchase requests
- `maintenance` - Maintenance schedules
- `incidents` - Issue tracking
- `inventory` - Stock management
- `budgets` - Financial tracking

### Additional Tables
- `departments` - Department information
- `locations` - Asset locations
- `categories` - Item categories
- `audit_logs` - Change tracking
- `notifications` - Alert management
- `file_attachments` - Document storage

## Development Workflow

1. **Setup**: Clone repository and install dependencies
2. **Environment**: Copy `.env.example` to `.env.local` and configure
3. **Database**: Run Supabase migrations
4. **Development**: Start development server with `npm run dev`
5. **Testing**: Run tests with `npm test`
6. **Building**: Build for production with `npm run build`

## Best Practices

- Use TypeScript for all new code
- Follow component naming conventions
- Implement proper error handling
- Write tests for critical functionality
- Use semantic commit messages
- Keep components small and focused
- Implement proper loading states
- Use proper TypeScript types 