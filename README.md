# 🖥️ IT Department Management System (IT-DMS)

A comprehensive, modern IT department management solution built with Next.js, Supabase, and TypeScript.

## 🎯 Project Overview

IT-DMS is a centralized data recording and tracking system designed specifically for IT departments. It handles assets, vendors, requisitions, bundles, licenses, maintenance, incidents, and provides reports, reminders, and automations for IT operations.

## ✨ Key Features

### Core Modules
- **Asset Management** - Track devices, inventory, and movements
- **Purchase Requisitions** - Approval workflows and vendor management
- **Maintenance Scheduling** - Preventive and corrective maintenance
- **Incident Management** - Issue tracking and resolution
- **Employee IT Profiles** - Device assignments and access management
- **Financial Management** - Budget tracking and ROI calculations
- **Knowledge Management** - AI-powered search and documentation
- **Resource Scheduling** - Intelligent technician and equipment scheduling

### Advanced Features
- **Real-time Dashboard** - Live updates and analytics
- **Automated Workflows** - Email notifications and reminders
- **API Integrations** - cPanel, ClickUp, and external services
- **Mobile Responsive** - Works on all devices
- **Role-based Access** - Secure user permissions

## 🛠️ Tech Stack

- **Frontend**: Next.js 14, React, TypeScript, Tailwind CSS
- **Backend**: Supabase (PostgreSQL, Auth, Real-time)
- **Deployment**: Vercel
- **APIs**: cPanel API, ClickUp API
- **Development**: Cursor IDE, GitHub

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ 
- Git
- Supabase account
- Vercel account (optional for deployment)

### Installation

1. **Clone the repository**
   ```bash
   git clone git@github.com:KodingMaster1/it-desk.git
   cd it-desk
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env.local
   ```
   Fill in your Supabase credentials and other API keys.

4. **Run the development server**
   ```bash
   npm run dev
   ```

5. **Open your browser**
   Navigate to [http://localhost:3000](http://localhost:3000)

## 📁 Project Structure

```
it-dms/
├── src/
│   ├── app/                    # Next.js app router
│   │   ├── (auth)/            # Authentication pages
│   │   ├── dashboard/         # Main dashboard
│   │   ├── assets/           # Asset management
│   │   ├── requisitions/     # Purchase requisitions
│   │   ├── maintenance/      # Maintenance scheduling
│   │   ├── incidents/        # Incident management
│   │   ├── employees/        # Employee profiles
│   │   ├── vendors/          # Vendor management
│   │   ├── reports/          # Analytics and reports
│   │   └── settings/         # System settings
│   ├── components/           # Reusable UI components
│   ├── lib/                  # Utilities and configurations
│   ├── types/                # TypeScript definitions
│   └── hooks/                # Custom React hooks
├── supabase/                 # Database migrations
├── docs/                     # Documentation
├── scripts/                  # Automation scripts
└── public/                   # Static assets
```

## 🗄️ Database Schema

### Core Tables
- `employees` - Employee information and IT profiles
- `devices` - Hardware and software assets
- `vendors` - Vendor information and performance
- `requisitions` - Purchase requests and approvals
- `maintenance` - Maintenance schedules and history
- `incidents` - Issue tracking and resolution
- `inventory` - Stock management and alerts
- `budgets` - Financial tracking and cost centers

## 🔧 Configuration

### Environment Variables
```env
# Supabase
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key

# APIs
CPANEL_API_KEY=your_cpanel_api_key
CLICKUP_API_KEY=your_clickup_api_key

# Email
SMTP_HOST=your_smtp_host
SMTP_PORT=587
SMTP_USER=your_smtp_user
SMTP_PASS=your_smtp_password
```

## 📊 Features Roadmap

### Phase 1 (Weeks 1-4) - Core Foundation
- [x] Project setup and structure
- [ ] Authentication system
- [ ] Basic CRUD operations
- [ ] User management

### Phase 2 (Weeks 5-8) - Asset Management
- [ ] Device tracking
- [ ] Inventory management
- [ ] Basic reporting
- [ ] File uploads

### Phase 3 (Weeks 9-12) - Workflow Automation
- [ ] Requisition approvals
- [ ] Maintenance scheduling
- [ ] Incident management
- [ ] Email notifications

### Phase 4 (Weeks 13-16) - Advanced Features
- [ ] API integrations
- [ ] Advanced analytics
- [ ] Mobile optimization
- [ ] Performance tuning

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Documentation**: [docs/](docs/)
- **Issues**: [GitHub Issues](https://github.com/KodingMaster1/it-desk/issues)
- **Discussions**: [GitHub Discussions](https://github.com/KodingMaster1/it-desk/discussions)

## 🙏 Acknowledgments

- Built with [Next.js](https://nextjs.org/)
- Powered by [Supabase](https://supabase.com/)
- Deployed on [Vercel](https://vercel.com/)
- Icons by [Lucide React](https://lucide.dev/)

---

**Made with ❤️ for IT Departments Worldwide** 