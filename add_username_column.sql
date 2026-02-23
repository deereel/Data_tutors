-- Data Tutors - Add username column to users table
-- Run this SQL to add the username column

ALTER TABLE users ADD COLUMN username VARCHAR(50) NULL AFTER name;

-- Update existing users to have usernames based on email
UPDATE users SET username = SUBSTRING_INDEX(email, '@', 1) WHERE username IS NULL;

-- Make username NOT NULL after updating existing records
ALTER TABLE users MODIFY COLUMN username VARCHAR(50) NOT NULL;

-- Add unique index for username
CREATE UNIQUE INDEX idx_username ON users(username);
