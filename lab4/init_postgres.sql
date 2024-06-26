CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES Categories(id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL
);


CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id),
    order_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE Order_Items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES Orders(id),
    product_id INTEGER REFERENCES Products(id),
    quantity INTEGER NOT NULL
);

CREATE TABLE Addresses (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id),
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country_code VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL
);

CREATE TABLE Payments (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES Orders(id),
    payment_amount NUMERIC(10, 2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    transaction_status VARCHAR(20) NOT NULL
);-- Users

INSERT INTO Users (username, email, password_hash)
VALUES 
    ('john_doe', 'john.doe@example.com', 'hash1'),
    ('jane_smith', 'jane.smith@example.com', 'hash2'),
    ('alex_johnson', 'alex.johnson@example.com', 'hash3'),
    ('emily_brown', 'emily.brown@example.com', 'hash4'),
    ('michael_clark', 'michael.clark@example.com', 'hash5');

-- Categories
INSERT INTO Categories (name)
VALUES 
    ('Electronics'),
    ('Clothing'),
    ('Books'),
    ('Home & Kitchen'),
    ('Sports');

-- Products
INSERT INTO Products (category_id, name, description, price, quantity)
VALUES 
    (1, 'Laptop', 'High-performance laptop with SSD', 1200.00, 50),
    (1, 'Smartphone', 'Latest smartphone model with HD display', 800.00, 100),
    (2, 'T-shirt', 'Cotton t-shirt with trendy design', 25.00, 200),
    (2, 'Jeans', 'Classic denim jeans for everyday wear', 50.00, 150),
    (3, 'Novel', 'Bestseller novel by famous author', 15.00, 300),
    (4, 'Coffee Maker', 'Automatic coffee maker for home use', 75.00, 80),
    (5, 'Football', 'Official size and weight football', 20.00, 50),
    (5, 'Yoga Mat', 'Non-slip yoga mat for comfortable workouts', 30.00, 100);

-- Orders
INSERT INTO Orders (user_id, total_price)
VALUES 
    (1, 200.00),
    (2, 120.00),
    (3, 150.00),
    (4, 75.00),
    (5, 100.00);

-- Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity)
VALUES 
    (1, 1, 1),
    (1, 2, 2),
    (2, 3, 3),
    (2, 4, 1),
    (3, 5, 2),
    (3, 6, 1),
    (4, 7, 1),
    (5, 8, 3);

-- Addresses
INSERT INTO Addresses (user_id, street, city, country_code, postal_code)
VALUES 
    (1, '123 Main St', 'New York', 'US', '10001'),
    (2, '456 Elm St', 'London', 'UK', 'SW1A 1AA'),
    (3, '789 Oak St', 'Toronto', 'CA', 'M5H 2N2'),
    (4, '101 Pine St', 'Sydney', 'AU', '2000'),
    (5, '202 Maple St', 'Berlin', 'DE', '10115');

-- Payments
INSERT INTO Payments (order_id, payment_amount, payment_method, transaction_status)
VALUES 
    (1, 200.00, 'Credit Card', 'Success'),
    (2, 120.00, 'PayPal', 'Success'),
    (3, 150.00, 'Stripe', 'Success'),
    (4, 75.00, 'Credit Card', 'Success'),
    (5, 100.00, 'PayPal', 'Success');
