#!/bin/bash

# IT-DMS Project Setup Script
# This script sets up the development environment for the IT-DMS project

set -e

echo "🚀 Setting up IT-DMS Development Environment"
echo "============================================="

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version 18+ is required. Current version: $(node -v)"
    exit 1
fi

echo "✅ Node.js version: $(node -v)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ npm version: $(npm -v)"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Create environment file if it doesn't exist
if [ ! -f .env.local ]; then
    echo "📝 Creating .env.local file..."
    cp env.example .env.local
    echo "⚠️  Please update .env.local with your actual configuration values"
fi

# Check if Supabase CLI is installed
if ! command -v supabase &> /dev/null; then
    echo "📦 Installing Supabase CLI..."
    npm install -g supabase
fi

echo "✅ Supabase CLI version: $(supabase --version)"

# Initialize Supabase (if not already initialized)
if [ ! -f supabase/config.toml ]; then
    echo "🔧 Initializing Supabase..."
    supabase init
fi

# Create necessary directories
echo "📁 Creating necessary directories..."
mkdir -p src/components/ui
mkdir -p src/components/forms
mkdir -p src/components/layout
mkdir -p src/components/dashboard
mkdir -p src/components/assets
mkdir -p src/components/requisitions
mkdir -p src/lib
mkdir -p src/types
mkdir -p src/hooks
mkdir -p src/utils
mkdir -p src/styles
mkdir -p src/constants
mkdir -p public/images
mkdir -p public/icons
mkdir -p tests/unit
mkdir -p tests/integration
mkdir -p tests/e2e

# Set up Git hooks (if husky is installed)
if [ -f .husky/pre-commit ]; then
    echo "🔧 Setting up Git hooks..."
    npx husky install
fi

# Run type checking
echo "🔍 Running type checking..."
npm run type-check

# Run linting
echo "🧹 Running linting..."
npm run lint

echo ""
echo "🎉 Setup completed successfully!"
echo ""
echo "Next steps:"
echo "1. Update .env.local with your configuration"
echo "2. Set up your Supabase project"
echo "3. Run 'npm run dev' to start development server"
echo "4. Visit http://localhost:3000 to see your application"
echo ""
echo "Happy coding! 🚀" 