CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
);

CREATE TABLE Products (
    id INTEGER AUTOINCREMENT PRIMARY KEY,
    category_id INTEGER,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL,

    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE Categories (
    id INTEGER AUTOINCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
);

CREATE TABLE Orders (
    id INTEGER AUTOINCREMENT PRIMARY KEY,
    user_id INTEGER,
    order_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price NUMERIC(10, 2) NOT NULL,

    FOREIGN KEY(user_id) RFERENCES Users(id)
);

CREATE TABLE Order_Items (
    order_item_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER NOT NULL,

    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Addresses (
    id INTEGER AUTOINCREMENT PRIMARY KEY,
    user_id INTEGER,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country_code VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,

    FOREIGN KEY(user_id) REFERENCES Users(id)
);

CREATE TABLE Payments (
    id INTEGER AUTOINCREMENT PRIMARY KEY,
    order_id INTEGER,
    payment_amount NUMERIC(10, 2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    transaction_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (order_id) REFERENCES Orders(id)
);
