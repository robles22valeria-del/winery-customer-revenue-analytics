-- Winery Customer & Revenue Analytics
-- Fictional portfolio dataset inspired by boutique winery operations.

DROP DATABASE IF EXISTS winery_analytics;
CREATE DATABASE winery_analytics;
USE winery_analytics;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(120),
    city VARCHAR(80),
    state CHAR(2),
    age_group VARCHAR(20)
);

CREATE TABLE wine (
    wine_id INT PRIMARY KEY,
    wine_name VARCHAR(100),
    varietal VARCHAR(80),
    vintage INT,
    wine_type VARCHAR(30),
    bottle_price DECIMAL(10,2)
);

CREATE TABLE visit (
    visit_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    visit_date DATE,
    party_size INT,
    tasting_type VARCHAR(60),
    reservation_type VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE transaction_record (
    transaction_id INT PRIMARY KEY,
    visit_id INT NOT NULL,
    transaction_date DATE,
    subtotal DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (visit_id) REFERENCES visit(visit_id)
);

CREATE TABLE transaction_item (
    transaction_item_id INT PRIMARY KEY,
    transaction_id INT NOT NULL,
    wine_id INT NOT NULL,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (transaction_id) REFERENCES transaction_record(transaction_id),
    FOREIGN KEY (wine_id) REFERENCES wine(wine_id)
);

CREATE TABLE membership (
    membership_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    membership_tier VARCHAR(30),
    join_date DATE,
    membership_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
