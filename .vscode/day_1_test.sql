SELECT VERSION();
 

DROP DATABASE IF EXISTS myshop;

-- create DATABASE
CREATE DATABASE myshop;

-- SWITCH TO THE DATABASE
USE myshop;

-- CREATE USERS TABLE
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) 

);

-- CREATE ORDER TABLE WITH A FOREIGN KEY
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (user_id, name, email)
VALUES (101, 'Mary', 'mary@example.com'),
       (102, 'John', 'john@example.com'),
       (103, 'Ann', 'ann@example.com'),
       (104, 'Mike', 'mike@example.com'),
       (105, 'Ruth', 'ruth@example.com'),
       (106, 'Joan', 'joan@example.com');



INSERT INTO Orders (order_id, user_id, product_name) 
VALUES (5001, 101, 'Shoes'),
       (5002, 101, 'Bag'),
       (5003, 102, 'Phone');

SELECT u.name, o.product_name
FROM Users u 
JOIN Orders o ON u.user_id = o.user_id;

-- DAY 2 

-- SELECT
-- 2. The Three Core Keywords
-- 🔹 SELECT

-- Chooses the columns you want to see.

-- Example: SELECT name, email → only show the name and email columns.

-- SELECT * → the asterisk * means “show everything (all columns).”

-- 🔹 FROM

-- Tells SQL which table you’re pulling the data from.

-- Example: FROM Users → look in the Users table.

-- 🔹 LIMIT

-- Controls how many rows you want to see.

-- Example: LIMIT 5 → only return the first 5 rows.

-- ⚠️ Important: Tables in SQL are like bags of data, not ordered lists. Without ORDER BY, “first 5 rows” just means “any 5 rows the database happens to return.”

-- user_id | name   | email
-- --------+--------+-------------------
-- 101     | Mary   | mary@example.com
-- 102     | John   | john@example.com
-- 103     | Alice  | alice@example.com
-- 104     | Bob    | bob@example.com
-- 105     | Eve    | eve@example.com
-- 106     | Dan    | dan@example.com
-- 
-- EXAMPLE: WITH OUR TABLE FROM DAY 1
-- 🔹 Select all columns, but limit rows

SELECT *
FROM Users
LIMIT 5;

-- Explanation

-- Explanation line by line:

-- SELECT * → fetch all the columns (user_id, name, email).

-- FROM Users → from the table called Users.

-- LIMIT 5; → only show the first 5 rows.

-- 👉 Output:

-- 🔹 Select specific columns

-- SELECT name, email
-- FROM Users
-- LIMIT 5;

-- 🚨 Important Note about LIMIT

-- LIMIT does not guarantee order.

-- If you want to be sure you always get the same “first 5,” you must use ORDER BY. Example:

SELECT *
FROM Users
ORDER BY user_id ASC
limit 5;

-- Exercise
-- Task 1. Select all columns from the Users table
-- SELECT *
-- FROM User;
-- ORDER BY user_id ASC
-- LIMIT 5

SELECT product_name
FROM Orders
ORDER BY order_id ASC
LIMIT 2;



