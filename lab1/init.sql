CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
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

CREATE TABLE Addresses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country_code VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,

    FOREIGN KEY(user_id) REFERENCES Users(id)
);

CREATE TABLE Payments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    payment_amount NUMERIC(10, 2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    transaction_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (order_id) REFERENCES Orders(id)
);

