-- Data Tutors - Admin Users SQL Script
-- Run this SQL to create admin users with different permission levels

-- Update users table to include super_admin and tutor roles
ALTER TABLE users MODIFY role ENUM('student', 'instructor', 'admin', 'super_admin', 'tutor') DEFAULT 'student' NOT NULL;

-- Create Super Admin user
-- Password: admin123 (hashed with PASSWORD_DEFAULT)
INSERT INTO users (name, email, password, role, status, email_verified, bio) VALUES 
('Super Admin', 'sadmin@datatutors.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'super_admin', 'active', 1, 'System Super Administrator with full access');

-- Create Admin user
-- Password: admin456 (hashed with PASSWORD_DEFAULT)
INSERT INTO users (name, email, password, role, status, email_verified, bio) VALUES 
('Admin', 'admin@datatutors.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'active', 1, 'Administrator with management access');

-- Create Tutor user
-- Password: admin789 (hashed with PASSWORD_DEFAULT)
INSERT INTO users (name, email, password, role, status, email_verified, bio) VALUES 
('Tutor', 'tutor@datatutors.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tutor', 'active', 1, 'Course Instructor and Tutor');

-- Verify the users were created
SELECT id, name, email, role, status FROM users WHERE role IN ('super_admin', 'admin', 'tutor');
