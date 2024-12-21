-- Create the BookHaven database
CREATE DATABASE IF NOT EXISTS BookHaven;

-- Use the database
USE BookHaven;

-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Bio TEXT,
    Nationality VARCHAR(50)
);

-- Create Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE,
    Genre VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT
);

-- Create Transactions table
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    PurchaseDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert sample data into Authors
INSERT INTO Authors (Name, Bio, Nationality) VALUES
('J.K. Rowling', 'Author of the Harry Potter series', 'British'),
('George R.R. Martin', 'Author of A Song of Ice and Fire', 'American');

-- Insert sample data into Books
INSERT INTO Books (Title, ISBN, Genre, Price, AuthorID) VALUES
('Harry Potter and the Philosopher\'s Stone', '9780747532699', 'Fantasy', 19.99, 1),
('A Game of Thrones', '9780553103540', 'Fantasy', 22.99, 2);

-- Insert sample data into Customers
INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street'),
('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Maple Avenue');

-- Insert sample data into Transactions
INSERT INTO Transactions (CustomerID, BookID, Quantity, TotalAmount) VALUES
(1, 1, 2, 39.98),
(2, 2, 1, 22.99);
