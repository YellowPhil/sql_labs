CREATE TABLE Addresses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country_code VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,

    FOREIGN KEY(user_id) REFERENCES Users(id)
);
CREATE TABLE Categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE Orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(user_id) REFERENCES Users(id)
);
CREATE TABLE Order_Items (
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER NOT NULL,

    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);
CREATE TABLE Payments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    payment_amount NUMERIC(10, 2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    transaction_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (order_id) REFERENCES Orders(id)
);
CREATE TABLE Products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_id INTEGER,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL,

    FOREIGN KEY (category_id) REFERENCES Categories(id)
);
CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- Insert users
INSERT INTO Users (username, email, password_hash) VALUES
('john_doe', 'john@example.com', 'hash1'),
('jane_doe', 'jane@example.com', 'hash2'),
('alice_smith', 'alice@example.com', 'hash3'),
('bob_johnson', 'bob@example.com', 'hash4'),
('emma_davis', 'emma@example.com', 'hash5');

-- Insert addresses for these users
INSERT INTO Addresses (user_id, street, city, country_code, postal_code) VALUES
(1, '123 Main St', 'New York', 'USA', '10001'),
(2, '456 Oak St', 'Los Angeles', 'USA', '90001'),
(3, '789 Maple St', 'Toronto', 'CAN', 'M5A 1N1'),
(4, '101 Elm St', 'Vancouver', 'CAN', 'V6B 2T5'),
(5, '202 Pine St', 'Mexico City', 'MEX', '01000');

-- Insert categories
INSERT INTO Categories (name) VALUES
('Electronics'),
('Books'),
('Clothing');

-- Insert products
INSERT INTO Products (category_id, name, description, price, quantity) VALUES
(1, 'Laptop', 'High performance laptop', 999.99, 20),
(1, 'Smartphone', 'Latest model smartphone', 699.99, 25),
(2, 'Novel', 'Bestselling novel', 19.99, 30),
(2, 'Textbook', 'Educational textbook', 49.99, 35),
(3, 'T-shirt', 'Comfortable cotton t-shirt', 9.99, 40),
(3, 'Jeans', 'Classic blue jeans', 29.99, 45);

-- Insert orders
INSERT INTO Orders (user_id, order_date) VALUES
(1, '2024-01-15'),
(2, '2024-01-20'),
(3, '2024-02-10'),
(4, '2024-02-15'),
(5, '2024-03-05'),
(1, '2024-03-10'),
(2, '2024-04-20'),
(3, '2024-04-25'),
(4, '2024-05-15'),
(5, '2024-05-20'),
(1, '2024-06-05'),
(2, '2024-06-10'),
(3, '2024-07-15'),
(4, '2024-07-20'),
(5, '2024-08-05'),
(1, '2024-08-10'),
(2, '2024-09-15'),
(3, '2024-09-20');

-- Insert order items
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 1),
(6, 1, 2),
(7, 2, 3),
(8, 3, 4),
(9, 4, 1),
(10, 5, 2),
(11, 1, 3),
(12, 2, 4),
(13, 3, 1),
(14, 4, 2),
(15, 5, 3),
(16, 1, 4),
(17, 2, 1),
(18, 3, 2);

