-- SELECT VERSION();
-- SELECT DATABASE();

-- DROP DATABASE IF EXISTS myshopday2;

CREATE DATABASE myshopday2;

USE myshopday2;

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


-- INSERT sample orders for all users
INSERT INTO Orders (order_id, user_id, product_name) 
VALUES 
    (5001, 101, 'Shoes'),       -- Mary
    (5002, 101, 'Bag'),         -- Mary
    (5003, 102, 'Phone'),       -- John
    (5004, 103, 'Laptop'),      -- Ann
    (5005, 104, 'Watch'),       -- Mike
    (5006, 105, 'Headphones'),  -- Ruth
    (5007, 106, 'Tablet');      -- Joan

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
from Users
ORDER BY user_id ASC
limit 5;

-- Exercise
-- Task 1. Select all columns from the Users table
SELECT *
FROM Users
ORDER BY user_id ASC
LIMIT 5;

SELECT product_name
FROM Orders
ORDER BY order_id ASC
LIMIT 2;





ALTER TABLE Users
ADD COLUMN birth_year INT;

DESCRIBE Users;

