-- Data Tutors - Database Schema Update
-- Add username column to users table

-- Add username column if it doesn't exist
ALTER TABLE users ADD COLUMN IF NOT EXISTS username VARCHAR(50) NULL AFTER name;

-- Add unique index for username
CREATE UNIQUE INDEX IF NOT EXISTS idx_username ON users(username);

-- Update existing users to have usernames based on email
UPDATE users SET username = SUBSTRING_INDEX(email, '@', 1) WHERE username IS NULL;

-- Update users table to make username required for new registrations
ALTER TABLE users MODIFY username VARCHAR(50) NOT NULL;

-- Update create_admin_users.sql to include usernames
-- Passwords are hashed with PASSWORD_DEFAULT

-- Create Super Admin user
INSERT INTO users (name, username, email, password, role, status, email_verified, bio) VALUES 
('Super Admin', 'sadmin', 'sadmin@datatutors.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'super_admin', 'active', 1, 'System Super Administrator with full access')
ON DUPLICATE KEY UPDATE name = VALUES(name);

-- Create Admin user
INSERT INTO users (name, username, email, password, role, status, email_verified, bio) VALUES 
('Admin', 'admin', 'admin@datatutors.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'active', 1, 'Administrator with management access')
ON DUPLICATE KEY UPDATE name = VALUES(name);

-- Create Tutor user
INSERT INTO users (name, username, email, password, role, status, email_verified, bio) VALUES 
('Tutor', 'tutor', 'tutor@datatutors.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tutor', 'active', 1, 'Course Instructor and Tutor')
ON DUPLICATE KEY UPDATE name = VALUES(name);

-- Verify the users
SELECT id, name, username, email, role, status FROM users WHERE role IN ('super_admin', 'admin', 'tutor');
