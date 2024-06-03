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

INSERT INTO Users (username, email, password_hash) VALUES
('john_doe', 'john@example.com', 'hashed_password_123'),
('jane_smith', 'jane@example.com', 'hashed_password_456'),
('alice_wonderland', 'alice@example.com', 'hashed_password_789'),
('bob_miller', 'bob@example.com', 'hashed_password_abc'),
('emma_jones', 'emma@example.com', 'hashed_password_def');

INSERT INTO Categories (name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Garden'),
('Sports');

INSERT INTO Products (category_id, name, description, price, quantity) VALUES
(1, 'Smartphone', 'Latest smartphone model', 799.99, 20),
(2, 'T-shirt', 'Cotton T-shirt', 19.99, 50),
(3, 'The Great Gatsby', 'Classic novel by F. Scott Fitzgerald', 12.99, 30),
(4, 'Lawn mower', 'Electric lawn mower', 199.99, 10),
(5, 'Football', 'Official size and weight football', 29.99, 25);

INSERT INTO Addresses (user_id, street, city, country_code, postal_code) VALUES
(1, '123 Main St', 'New York', 'US', '10001'),
(2, '456 Elm St', 'Los Angeles', 'US', '90001'),
(3, '789 Oak St', 'Chicago', 'US', '60601'),
(4, '101 Pine St', 'San Francisco', 'US', '94101'),
(5, '202 Maple St', 'Seattle', 'US', '98101');

INSERT INTO Orders (user_id, order_date) VALUES
(1, '2024-06-01'),
(2, '2024-06-01'),
(3, '2024-06-01'),
(4, '2024-06-02'),
(5, '2024-06-02');

INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 3),
(2, 4, 1),
(3, 5, 2),
(4, 1, 1),
(4, 3, 1),
(4, 5, 3);

INSERT INTO Payments (order_id, payment_amount, payment_method, transaction_status) VALUES
(1, 1812.96, 'Credit Card', 'Completed'),
(2, 89.96, 'PayPal', 'Completed'),
(3, 89.97, 'Credit Card', 'Completed'),
(4, 1789.94, 'Debit Card', 'Completed');


-- Insert new users
INSERT INTO Users (username, email, password_hash) VALUES
('user1', 'user1@example.com', 'hash1'),
('user2', 'user2@example.com', 'hash2'),
('user3', 'user3@example.com', 'hash3'),
('user4', 'user4@example.com', 'hash4'),
('user5', 'user5@example.com', 'hash5');

-- Insert addresses for these users
INSERT INTO Addresses (user_id, street, city, country_code, postal_code) VALUES
(1, '123 Main St', 'CityA', 'UK', '12345'),
(2, '456 Maple St', 'CityB', 'UK', '67890'),
(3, '789 Oak St', 'CityC', 'CAN', 'A1B2C3'),
(4, '101 Pine St', 'CityD', 'CAN', 'D4E5F6'),
(5, '202 Birch St', 'CityE', 'MEX', '98765');

-- Insert categories
INSERT INTO Categories (name) VALUES
('Electronics'),
('Books'),
('Clothing');

-- Insert products
INSERT INTO Products (category_id, name, description, price, quantity) VALUES
(1, 'Laptop', 'High performance laptop', 999.99, 50),
(1, 'Smartphone', 'Latest model smartphone', 699.99, 100),
(2, 'Novel', 'Bestselling novel', 19.99, 200),
(3, 'T-shirt', 'Comfortable cotton t-shirt', 9.99, 300);

-- Insert orders for different months and countries
INSERT INTO Orders (user_id, order_date) VALUES
(1, '2023-01-15'),
(2, '2023-01-20'),
(3, '2023-02-10'),
(4, '2023-02-15'),
(5, '2023-03-05'),
(1, '2023-03-10'),
(2, '2023-04-20'),
(3, '2023-04-25'),
(4, '2023-05-15'),
(5, '2023-05-20'),
(1, '2023-06-05'),
(2, '2023-06-10'),
(3, '2023-07-15'),
(4, '2023-07-20'),
(5, '2023-08-05'),
(1, '2023-08-10'),
(2, '2023-09-15'),
(3, '2023-09-20');

-- Insert order items for these orders
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(5, 1, 1),
(6, 2, 2),
(7, 3, 3),
(8, 4, 4),
(9, 1, 1),
(10, 2, 2),
(11, 3, 3),
(12, 4, 4),
(13, 1, 1),
(14, 2, 2),
(15, 3, 3),
(16, 4, 4),
(17, 1, 1),
(18, 2, 2);
