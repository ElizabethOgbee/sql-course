
-- 📅 Day 6 (Mon): Aggregation
-- 🔹 What is aggregation in SQL?

-- Normally, a query gives you row-by-row data.

-- Aggregation lets you combine many rows into a single value — like total, average, or maximum.

-- Think of it as: instead of asking “What’s each user’s birthdate?”, you ask “What’s the average birthdate year across all users?”.

-- SQL gives us aggregate functions for this:

-- COUNT() → counts rows.

-- SUM() → adds numbers.

-- AVG() → finds the average.

-- MIN() → smallest value.

-- MAX() → largest value.
-- Make sure I am in the right database
USE myshopday2;

ALTER TABLE Orders
ADD COLUMN amount INT;

-- add rows to amount
UPDATE Orders SET amount = 200 WHERE user_id = 101;
UPDATE Orders SET amount = 310 WHERE user_id = 102;
UPDATE Orders SET amount = 90 WHERE user_id = 103;
UPDATE Orders SET amount = 843 WHERE user_id = 104;
UPDATE Orders SET amount = 1500 WHERE user_id = 105;
UPDATE Orders SET amount = 200 WHERE user_id = 106;
UPDATE Orders SET amount = 109 WHERE user_id = 107;
 DESCRIBE Orders;


-- 1. COUNT

-- Counts how many rows exist (or how many non-NULL values in a column).

SELECT count(*) AS total_users
from Users;

-- 2. SUM

-- Adds all numbers in a column.

-- Example: If Orders table has a amount column:
SELECT SUM(amount) as total_sales
from Orders
