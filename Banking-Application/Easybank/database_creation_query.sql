-- Create database
CREATE DATABASE IF NOT EXISTS easybank_db;
USE easybank_db;

-- ADMINS TABLE
CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Default admin user
INSERT INTO admins (username, password)
VALUES ('admin', 'admin123')
ON DUPLICATE KEY UPDATE username = username;

-- CUSTOMERS TABLE
CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    mobile VARCHAR(15),
    email VARCHAR(100),
    accountType VARCHAR(50),
    initialBalance INT DEFAULT 0,
    dob DATE,
    idProof VARCHAR(100),
    accountNumber VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- TRANSACTIONS TABLE
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    transaction_amount DOUBLE NOT NULL,
    transaction_date DATETIME NOT NULL,
    FOREIGN KEY (account_number) REFERENCES customers(accountNumber)
        ON DELETE CASCADE
);