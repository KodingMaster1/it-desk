# IT-DMS Deployment Guide

This guide covers deploying the IT-DMS application to various platforms.

## 🚀 Quick Deploy Options

### 1. Vercel (Recommended)

Vercel is the easiest way to deploy your Next.js application.

#### Prerequisites
- Vercel account
- GitHub repository connected to Vercel
- Supabase project set up

#### Steps

1. **Connect to Vercel**
   ```bash
   # Install Vercel CLI
   npm i -g vercel
   
   # Login to Vercel
   vercel login
   ```

2. **Deploy**
   ```bash
   # Deploy to Vercel
   vercel --prod
   ```

3. **Configure Environment Variables**
   - Go to your Vercel project dashboard
   - Navigate to Settings > Environment Variables
   - Add all variables from your `.env.local` file

#### Environment Variables for Vercel
```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
CPANEL_API_KEY=your_cpanel_api_key
CLICKUP_API_KEY=your_clickup_api_key
SMTP_HOST=your_smtp_host
SMTP_PORT=587
SMTP_USER=your_smtp_user
SMTP_PASS=your_smtp_password
```

### 2. Netlify

#### Steps

1. **Build the project**
   ```bash
   npm run build
   ```

2. **Deploy to Netlify**
   - Drag and drop the `.next` folder to Netlify
   - Or use Netlify CLI:
   ```bash
   npm install -g netlify-cli
   netlify deploy --prod --dir=.next
   ```

### 3. AWS Amplify

#### Steps

1. **Connect to AWS Amplify**
   - Go to AWS Amplify Console
   - Connect your GitHub repository
   - Configure build settings

2. **Build Settings**
   ```yaml
   version: 1
   frontend:
     phases:
       preBuild:
         commands:
           - npm ci
       build:
         commands:
           - npm run build
     artifacts:
       baseDirectory: .next
       files:
         - '**/*'
   ```

## 🗄️ Database Setup (Supabase)

### 1. Create Supabase Project

1. Go to [supabase.com](https://supabase.com)
2. Create a new project
3. Note down your project URL and anon key

### 2. Run Database Migrations

```bash
# Install Supabase CLI
npm install -g supabase

# Login to Supabase
supabase login

# Link your project
supabase link --project-ref your-project-ref

# Push migrations
supabase db push
```

### 3. Set up Row Level Security (RLS)

```sql
-- Enable RLS on all tables
ALTER TABLE employees ENABLE ROW LEVEL SECURITY;
ALTER TABLE devices ENABLE ROW LEVEL SECURITY;
ALTER TABLE vendors ENABLE ROW LEVEL SECURITY;
-- ... repeat for all tables

-- Create policies
CREATE POLICY "Users can view their own data" ON employees
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "IT staff can view all data" ON employees
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM employees 
      WHERE user_id = auth.uid() 
      AND role = 'it_admin'
    )
  );
```

## 🔧 Environment Configuration

### Development Environment

1. **Copy environment template**
   ```bash
   cp env.example .env.local
   ```

2. **Configure variables**
   ```env
   # Supabase
   NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
   SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
   
   # External APIs
   CPANEL_API_KEY=your-cpanel-api-key
   CLICKUP_API_KEY=your-clickup-api-key
   
   # Email
   SMTP_HOST=smtp.gmail.com
   SMTP_PORT=587
   SMTP_USER=your-email@gmail.com
   SMTP_PASS=your-app-password
   ```

### Production Environment

1. **Set up environment variables in your hosting platform**
2. **Use production-grade services**
   - Use a proper SMTP service (SendGrid, Mailgun, etc.)
   - Set up proper monitoring and logging
   - Configure CDN for static assets

## 🔒 Security Considerations

### 1. Environment Variables
- Never commit `.env.local` to version control
- Use different keys for development and production
- Rotate API keys regularly

### 2. Database Security
- Enable Row Level Security (RLS)
- Use prepared statements
- Implement proper authentication
- Regular security audits

### 3. API Security
- Rate limiting
- Input validation
- CORS configuration
- HTTPS only

## 📊 Monitoring and Analytics

### 1. Application Monitoring
- Set up error tracking (Sentry)
- Performance monitoring
- User analytics

### 2. Database Monitoring
- Query performance
- Connection pooling
- Backup monitoring

### 3. Infrastructure Monitoring
- Server health
- Response times
- Error rates

## 🔄 CI/CD Pipeline

### GitHub Actions

The project includes automated CI/CD workflows:

1. **Development Workflow** (`development.yml`)
   - Runs on feature branches
   - Tests, linting, type checking
   - Security audits

2. **Production Workflow** (`ci-cd.yml`)
   - Runs on main branch
   - Full testing and building
   - Automatic deployment to Vercel

### Manual Deployment

```bash
# Build for production
npm run build

# Start production server
npm start

# Or use PM2 for process management
npm install -g pm2
pm2 start npm --name "it-dms" -- start
```

## 🚨 Troubleshooting

### Common Issues

1. **Build Failures**
   ```bash
   # Clear cache
   rm -rf .next
   npm run build
   ```

2. **Environment Variables**
   - Check all required variables are set
   - Verify variable names match exactly
   - Restart development server after changes

3. **Database Connection**
   - Verify Supabase URL and keys
   - Check network connectivity
   - Verify RLS policies

4. **Performance Issues**
   - Enable Next.js analytics
   - Optimize images and assets
   - Use proper caching strategies

## 📈 Scaling Considerations

### 1. Application Scaling
- Use CDN for static assets
- Implement caching strategies
- Optimize database queries

### 2. Database Scaling
- Connection pooling
- Read replicas
- Query optimization

### 3. Infrastructure Scaling
- Auto-scaling groups
- Load balancers
- Monitoring and alerting

## 🔄 Backup and Recovery

### 1. Database Backups
```bash
# Supabase automatic backups
# Configure backup schedule in Supabase dashboard

# Manual backup
supabase db dump --data-only > backup.sql
```

### 2. Application Backups
- Version control for code
- Environment variable backups
- Configuration backups

### 3. Disaster Recovery
- Document recovery procedures
- Test recovery processes
- Maintain backup schedules

## 📞 Support

For deployment issues:
1. Check the troubleshooting section
2. Review logs and error messages
3. Consult platform documentation
4. Create an issue in the GitHub repository

---

**Happy Deploying! 🚀** 