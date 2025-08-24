@echo off
REM IT-DMS Project Setup Script for Windows
REM This script sets up the development environment for the IT-DMS project

echo 🚀 Setting up IT-DMS Development Environment
echo =============================================

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js 18+ first.
    pause
    exit /b 1
)

REM Check Node.js version
for /f "tokens=1,2,3 delims=." %%a in ('node --version') do set NODE_VERSION=%%a
set NODE_VERSION=%NODE_VERSION:~1%
if %NODE_VERSION% LSS 18 (
    echo ❌ Node.js version 18+ is required. Current version: 
    node --version
    pause
    exit /b 1
)

echo ✅ Node.js version: 
node --version

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm first.
    pause
    exit /b 1
)

echo ✅ npm version: 
npm --version

REM Install dependencies
echo 📦 Installing dependencies...
npm install

REM Create environment file if it doesn't exist
if not exist .env.local (
    echo 📝 Creating .env.local file...
    copy env.example .env.local
    echo ⚠️  Please update .env.local with your actual configuration values
)

REM Check if Supabase CLI is installed
supabase --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 📦 Installing Supabase CLI...
    npm install -g supabase
)

echo ✅ Supabase CLI version: 
supabase --version

REM Initialize Supabase (if not already initialized)
if not exist supabase\config.toml (
    echo 🔧 Initializing Supabase...
    supabase init
)

REM Create necessary directories
echo 📁 Creating necessary directories...
if not exist src\components\ui mkdir src\components\ui
if not exist src\components\forms mkdir src\components\forms
if not exist src\components\layout mkdir src\components\layout
if not exist src\components\dashboard mkdir src\components\dashboard
if not exist src\components\assets mkdir src\components\assets
if not exist src\components\requisitions mkdir src\components\requisitions
if not exist src\lib mkdir src\lib
if not exist src\types mkdir src\types
if not exist src\hooks mkdir src\hooks
if not exist src\utils mkdir src\utils
if not exist src\styles mkdir src\styles
if not exist src\constants mkdir src\constants
if not exist public\images mkdir public\images
if not exist public\icons mkdir public\icons
if not exist tests\unit mkdir tests\unit
if not exist tests\integration mkdir tests\integration
if not exist tests\e2e mkdir tests\e2e

REM Set up Git hooks (if husky is installed)
if exist .husky\pre-commit (
    echo 🔧 Setting up Git hooks...
    npx husky install
)

REM Run type checking
echo 🔍 Running type checking...
npm run type-check

REM Run linting
echo 🧹 Running linting...
npm run lint

echo.
echo 🎉 Setup completed successfully!
echo.
echo Next steps:
echo 1. Update .env.local with your configuration
echo 2. Set up your Supabase project
echo 3. Run 'npm run dev' to start development server
echo 4. Visit http://localhost:3000 to see your application
echo.
echo Happy coding! 🚀
pause 