-- Create the database
CREATE DATABASE IF NOT EXISTS smart_pos;

-- Switch to the newly created database
USE smart_pos;

-- Table for storing user information
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    contactNumber VARCHAR(20) NOT NULL,
    role VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_username (username), -- Index on username for faster lookups
    INDEX idx_email (email) -- Index on email for faster lookups
);

-- Table for storing product categories
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_name (name) -- Index on category name for faster lookups
);

-- Table for user roles
CREATE TABLE IF NOT EXISTS roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_name (name) -- Index on category name for faster lookups
);

-- Table for storing products
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_category_id (category_id), -- Index on category_id for faster category-based queries
    INDEX idx_name (name) -- Index on product name for faster lookups
);

-- Table for storing sales transactions
CREATE TABLE IF NOT EXISTS sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10, 2) NOT NULL,
    user_id INT
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_product_id (product_id), -- Index on product_id for faster product-based queries
    INDEX idx_sale_date (sale_date) -- Index on sale_date for faster date-based queries
    INDEX idx_user_id (sale_date) -- Index on user id for faster look-up
);
