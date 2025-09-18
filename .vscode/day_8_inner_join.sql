-- 📅 Day 8 (Wed): Joins
-- 🔹 Why do we need JOINs?

-- In a relational database, data is split across multiple tables for efficiency and to avoid duplication.

-- Example:

-- Users table → stores user info (ID, name, email, etc.).

-- Orders table → stores order info (order ID, user ID, amount, etc.).

-- 👉 Instead of storing the user’s name inside every order (which would duplicate data), we just store a foreign key (user_id) in the Orders table.

-- 1. Foreign Keys

-- A primary key (PK) uniquely identifies a row in a table.

-- A foreign key (FK) is a column in another table that points back to the PK.

-- Example:

-- Users Table

-- user_id (PK)	name	email
-- 1	Alice	alice@email.com

-- 2	David	david@email.com

-- 3	Sarah	sarah@email.com

-- Orders Table

-- order_id (PK)	user_id (FK)	product	amount
-- 101	1	Laptop	1200
-- 102	2	Phone	800
-- 103	1	Mouse	25
-- 104	3	Keyboard	60

-- Here:

-- Users.user_id is the primary key.

-- Orders.user_id is a foreign key that points to Users.user_id.
USE myshopday2;
DESCRIBE Orders;

-- 2. INNER JOIN

-- INNER JOIN combines rows only where the foreign key matches the primary key.

-- Think: “Show me only the orders that have a matching user.”

-- ✅ Query: Join Users and Orders to get user names and their orders
SELECT 
    Users.name, 
    Orders.product_name, 
    Orders.amount
FROM Users
INNER JOIN Orders
    ON Users.user_id = Orders.user_id;

-- 🔍 Explanation

-- SELECT Users.name, Orders.product, Orders.amount

-- Pick the columns you want: user’s name + what they ordered + amount.

-- FROM Users

-- Start from the Users table.

-- INNER JOIN Orders

-- Join it with the Orders table.

-- ON Users.user_id = Orders.user_id

-- Match rows where the user_id in Users = user_id in Orders.

-- 📊 Result
-- name	product	amount
-- Alice	Laptop	1200
-- David	Phone	800
-- Alice	Mouse	25
-- Sarah	Keyboard	60

-- 👉 Notice:

-- Alice appears twice because she has 2 orders.

-- Each order is matched with the correct user via the foreign key.

-- ⚡ Key Takeaway

-- INNER JOIN = only keep rows that match in both tables.

-- Foreign keys are the “glue” connecting related tables.