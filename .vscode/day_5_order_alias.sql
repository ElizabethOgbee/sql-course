-- Sorting & Aliases

-- 1. ORDER BY

-- SQL normally gives you results in any order (no guarantee).

-- ORDER BY lets you control the sequence of rows.

-- You can sort:

-- Ascending (ASC) → smallest → largest (default if you don’t specify).

-- Descending (DESC) → largest → smallest.

-- 2. Aliases (AS)

-- An alias is a temporary name for a column or table in your query.

-- It doesn’t change the real column name in the database — it’s just for readability.

-- Useful when:

-- The column name is long.

-- You want more descriptive output.

-- You’re doing calculations.
USE myshopday2;

-- Add new column to table Users
ALTER TABLE Users
ADD COLUMN registration_date DATE;

-- Update existing rows with registration_dates
UPDATE Users set registration_date = '2023-12-20' WHERE user_id = 101;
UPDATE Users set registration_date = '2024-01-02' WHERE user_id = 102;
UPDATE Users set registration_date = '2024-03-15' WHERE user_id = 103;
UPDATE Users set registration_date = '2024-04-20' WHERE user_id = 104;
UPDATE Users set registration_date = '2022-11-20' WHERE user_id = 105;
UPDATE Users set registration_date = '2024-07-04' WHERE user_id = 106;

DESCRIBE Users;
SELECT * FROM Users;

-- Query: Sort users by registration date, descending

SELECT user_id, name, registration_date AS reg_date
FROM Users
ORDER BY registration_date DESC;

-- 3. AVG

-- Finds the average of a numeric column.

SELECT avg(amount) AS avg_order_value
FROM Orders;

-- 4. MIN and MAX

-- Finds the smallest and largest value.
SELECT MIN(birth_year) AS oldest_user, MAX(birth_year) as youngest_user
FROM Users;

-- 📊 Sorting with Multiple Columns in SQL
-- 1. Why sort by more than one column?

-- Sometimes rows share the same value in one column.

-- To break ties, you can sort by a second (or third, etc.) column.

-- ✅ Example: Sort Users by registration date (newest first), then by name (A–Z)
SELECT user_id, name, registration_date
FROM Users
ORDER BY registration_date DESC, name ASC;

-- 🔍 Explanation

-- ORDER BY registration_date DESC

-- Sort by registration date first → newest users appear on top.

-- , name ASC

-- If two users registered on the same date, sort them alphabetically by name.

-- 📊 Example Result
-- user_id	name	registration_date
-- 5	Sarah	2025-09-01
-- 3	John	2025-09-01
-- 2	Alice	2024-05-10
-- 1	David	2024-05-10

-- 👉 Both Sarah and John registered on 2025-09-01, but Sarah comes before John alphabetically.

-- ⚡ Key point:

-- SQL sorts in the order you list columns.

-- You can mix ASC and DESC in the same query.

-- Would you like me to also show you how sorting works with numeric + text + date columns together (since they behave slightly differently), or should we stay with text/date for now?