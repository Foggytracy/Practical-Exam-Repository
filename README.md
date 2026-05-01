Web Developer Practical Exam - Next.js Headless CMS
This project is a full-stack Next.js application integrated with a PostgreSQL database. It features a responsive frontend converted from Figma and a protected admin dashboard for managing content collections like Services, Case Studies, and Team Members.

# Tech Stack
   - Frontend/Backend: Next.js 14+ (App Router)
   - Database: PostgreSQL
   - Authentication: JWT (JSON Web Tokens) via jose middleware
   - Styling: Tailwind CSS

# SETUP INSTRUCTIONS
Locate the provided .env.local file in the root directory and update the DATABASE_URL and JWT_SECRET variables with your local environment credentials.

        Database connection string
        DATABASE_URL="postgresql://[user]:[password]@localhost:5432/[database_name]"

        Secret key for JWT signing (minimum 32 characters recommended)
        JWT_SECRET="your_super_secret_exam_key_123"

        Node environment
        NODE_ENV="development"

# 2. Installation
Install the necessary dependencies:

Bash
npm install

# MIGRATION AND SEEDING STEPS
Execute the following SQL in your PostgreSQL terminal or pgAdmin to create the required tables with the necessary constraints:

Github link: https://github.com/Foggytracy/Practical-Exam-Repository/blob/main/agency_full_backup.sql

# HOW TO RUN

# Development
Start the development server (runs both frontend and server actions):
paste in terminal

        npm run dev 

The application will be available at http://localhost:3000.

# Production

        npm run build
        npm run start

# ADMIN CREDENTIALS
Access the dashboard at /admin/login.

Username: admin@gmail.com
Password: admin123

# Key Features & Constraints 
Responsive UI: Optimized for Mobile (375px), Tablet (768px), and Desktop (1280px).

Protected Routes: All /admin routes require a valid JWT token.

Data Integrity: Implements is_active filtering and sort_order sorting for all public content.

Contact Management: Admin-only access to view and update the status of contact form submissions.