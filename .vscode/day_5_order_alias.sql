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
ALTER TABLE Users;
ADD COLUMN registration_date DATE;

-- Update existing rows with registration_dates
UPDATE Users set registration_date = '2023-12-20' WHERE user_id = 101;
UPDATE Users set registration_date = '2024-01-02' WHERE user_id = 101;
UPDATE Users set registration_date = '2024-03-15' WHERE user_id = 101;
UPDATE Users set registration_date = '2024-04-20' WHERE user_id = 101;
UPDATE Users set registration_date = '2022-11-20' WHERE user_id = 101;
UPDATE Users set registration_date = '2024-07-04' WHERE user_id = 101;

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
SELECT MIN(birth_year) AS oldest_user, MAX(birth_year) as Youngest_user
FROM Users;