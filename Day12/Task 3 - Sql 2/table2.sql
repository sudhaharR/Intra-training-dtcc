show databases; 
use datasql;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    payment_method VARCHAR(30)
);

INSERT INTO orders
(order_id, customer_name, city, product, category, quantity, price, order_date, payment_method)
VALUES
(1, 'Arun', 'Chennai', 'Laptop', 'Electronics', 1, 65000, '2026-01-10', 'UPI'),
(2, 'Priya', 'Bangalore', 'Smartphone', 'Electronics', 2, 28000, '2026-01-12', 'Credit Card'),
(3, 'Rahul', 'Chennai', 'Headphones', 'Accessories', 1, 3500, '2026-01-15', 'UPI'),
(4, 'Sneha', 'Hyderabad', 'Laptop', 'Electronics', 1, 72000, '2026-01-18', 'Debit Card'),
(5, 'Karthik', 'Mumbai', 'Office Chair', 'Furniture', 2, 8500, '2026-01-20', 'Credit Card'),
(6, 'Divya', 'Chennai', 'Keyboard', 'Accessories', 3, 1800, '2026-01-22', 'UPI'),
(7, 'Vijay', 'Delhi', 'Monitor', 'Electronics', 2, 15000, '2026-01-25', 'Debit Card'),
(8, 'Anjali', 'Bangalore', 'Mouse', 'Accessories', 2, 1200, '2026-01-27', 'UPI'),
(9, 'Suresh', 'Hyderabad', 'Desk', 'Furniture', 1, 12000, '2026-02-01', 'Credit Card'),
(10, 'Meena', 'Mumbai', 'Smartphone', 'Electronics', 1, 32000, '2026-02-03', 'UPI'),
(11, 'Ravi', 'Chennai', 'Laptop', 'Electronics', 2, 58000, '2026-02-05', 'Credit Card'),
(12, 'Nisha', 'Delhi', 'Bookshelf', 'Furniture', 1, 7000, '2026-02-08', 'Debit Card'),
(13, 'Ajay', 'Bangalore', 'Headphones', 'Accessories', 3, 4500, '2026-02-10', 'UPI'),
(14, 'Pooja', 'Mumbai', 'Monitor', 'Electronics', 1, 18000, '2026-02-12', 'Credit Card'),
(15, 'Manoj', 'Chennai', 'Office Chair', 'Furniture', 2, 9500, '2026-02-15', 'UPI'),
(16, 'Lakshmi', 'Hyderabad', 'Keyboard', 'Accessories', 4, 2200, '2026-02-18', 'Debit Card'),
(17, 'Hari', 'Delhi', 'Smartphone', 'Electronics', 2, 30000, '2026-02-20', 'UPI'),
(18, 'Swathi', 'Bangalore', 'Desk', 'Furniture', 1, 14000, '2026-02-22', 'Credit Card'),
(19, 'Gokul', 'Chennai', 'Mouse', 'Accessories', 5, 1000, '2026-02-25', 'UPI'),
(20, 'Asha', 'Mumbai', 'Laptop', 'Electronics', 1, 68000, '2026-02-28', 'Debit Card');

select * from orders;

SELECT product, price
FROM orders
WHERE price > 20000;

SELECT *
FROM orders
WHERE city = 'Chennai';

SELECT product, price
FROM orders
WHERE price BETWEEN 5000 AND 30000;

SELECT product, price
FROM orders
ORDER BY price DESC
LIMIT 5;

SELECT SUM(quantity) AS total_quantity
FROM orders;

SELECT
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM orders;

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM orders
GROUP BY category;

SELECT
    city,
    SUM(quantity * price) AS total_sales
FROM orders
GROUP BY city
ORDER BY total_sales DESC;

SELECT
    category,
    SUM(quantity * price) AS total_sales
FROM orders
GROUP BY category
HAVING SUM(quantity * price) > 50000;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    membership VARCHAR(30)
);

INSERT INTO customers
(customer_id, customer_name, age, membership)
VALUES
(1, 'Arun', 24, 'Gold'),
(2, 'Priya', 29, 'Silver'),
(3, 'Rahul', 25, 'Gold'),
(4, 'Sneha', 31, 'Platinum'),
(5, 'Karthik', 28, 'Silver'),
(6, 'Divya', 23, 'Gold'),
(7, 'Vijay', 35, 'Platinum'),
(8, 'Anjali', 27, 'Silver'),
(9, 'Suresh', 32, 'Gold'),
(10, 'Meena', 26, 'Silver'),
(11, 'Ravi', 30, 'Platinum'),
(12, 'Nisha', 29, 'Gold'),
(13, 'Ajay', 24, 'Silver'),
(14, 'Pooja', 33, 'Platinum'),
(15, 'Manoj', 27, 'Gold'),
(16, 'Lakshmi', 25, 'Silver'),
(17, 'Hari', 34, 'Gold'),
(18, 'Swathi', 28, 'Platinum'),
(19, 'Gokul', 23, 'Silver'),
(20, 'Asha', 30, 'Gold');

select * from customers;

SELECT
    o.customer_name,
    o.product,
    o.price,
    c.age,
    c.membership
FROM orders o
INNER JOIN customers c
    ON o.customer_name = c.customer_name;
    
SELECT
    c.membership,
    SUM(o.quantity * o.price) AS total_sales
FROM customers c
INNER JOIN orders o
    ON c.customer_name = o.customer_name
GROUP BY c.membership
HAVING SUM(o.quantity * o.price) > 100000;