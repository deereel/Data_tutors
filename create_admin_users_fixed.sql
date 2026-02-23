-- Data Tutors - Create Admin Users with Correct Passwords
-- Run this SQL to create admin users

-- First, add username column if not exists
ALTER TABLE users ADD COLUMN IF NOT EXISTS username VARCHAR(50) NULL AFTER name;

-- Update existing users to have usernames based on email
UPDATE users SET username = SUBSTRING_INDEX(email, '@', 1) WHERE username IS NULL;

-- Delete existing admin users if they exist (to recreate with correct passwords)
DELETE FROM users WHERE email IN ('sadmin@datatutors.com', 'admin@datatutors.com', 'tutor@datatutors.com');

-- Create Super Admin user with password: admin123
-- Password hash for 'admin123' using PASSWORD_DEFAULT
INSERT INTO users (name, username, email, password, role, status, email_verified, bio) VALUES 
('Super Admin', 'sadmin', 'sadmin@datatutors.com', '$2y$12$703vYWbqjb1jO30flbOMQOsuPagWatP37BS0xzMC9MYKzyHQ2Nq02', 'super_admin', 'active', 1, 'System Super Administrator with full access');

-- Create Admin user with password: admin456
INSERT INTO users (name, username, email, password, role, status, email_verified, bio) VALUES 
('Admin', 'admin', 'admin@datatutors.com', '$2y$12$uaTwFSkiVAsqGuwavoztzuvhAbkflPm0w6IofQBkWJuIx4i3KEjyu', 'admin', 'active', 1, 'Administrator with management access');

-- Create Tutor user with password: admin789
INSERT INTO users (name, username, email, password, role, status, email_verified, bio) VALUES 
('Tutor', 'tutor', 'tutor@datatutors.com', '$2y$12$8niaI3YtH4PmQSnda7ZTSe.ptdfYtJo5HWVKkEmQPenNLKPTck8kK', 'tutor', 'active', 1, 'Course Instructor and Tutor');

-- Verify the users were created
SELECT id, name, username, email, role, status FROM users WHERE role IN ('super_admin', 'admin', 'tutor');
