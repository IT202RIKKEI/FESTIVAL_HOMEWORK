-- CREATE DATABASE BOOK_WORM;

USE BOOK_WORM;

CREATE TABLE authors (
	author_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    birth_year YEAR NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    
    -- RÀNG BUỘC
    CONSTRAINT PK_AUTHORS PRIMARY KEY(author_id)
);

CREATE TABLE Books (
	book_id INT AUTO_INCREMENT,
    book_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    author_id INT,
    price DECIMAL(18,1) NOT NULL DEFAULT(0),
    publish_year YEAR NOT NULL,
    
    -- RÀNG BUỘC
    CONSTRAINT PK_Books PRIMARY KEY(book_id),
    CONSTRAINT FK_Books FOREIGN KEY(author_id) REFERENCES authors(author_id) ON DELETE CASCADE,
    CONSTRAINT CK_Books CHECK(price >= 0)
);

CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email varchar(50) NOT NULL,
    phone varchar(10) NOT NULL,
    registration_date TIMESTAMP NOT NULL DEFAULT(CURRENT_TIMESTAMP),
    
    CONSTRAINT PK_customers PRIMARY KEY(customer_id),
    CONSTRAINT UQ_customers_email UNIQUE(email),
    CONSTRAINT UQ_customers_phone UNIQUE(phone)
);


