-- 1. Logical Operators
-- 🔹 AND

-- Both conditions must be true.

-- Example: WHERE age > 18 AND age < 30 → only rows where both are true.

-- 🔹 OR

-- -- At least one condition must be true.

-- Example: WHERE city = 'Lagos' OR city = 'Abuja' → rows from either Lagos or Abuja.

-- 🔹 NOT

-- Reverses a condition.

-- Example: WHERE NOT city = 'Lagos' → all rows except Lagos.

-- 2. Special Operators
-- 🔹 IN

-- Matches any value from a list.

-- Example: WHERE product_name IN ('Shoes', 'Phone') → only orders of Shoes or Phone.

-- 🔹 LIKE (for patterns)

-- Used for string matching.

-- % = any number of characters, _ = one character.

-- Example:

-- WHERE name LIKE 'A%' → names starting with “A” (Alice, Anna).

-- WHERE email LIKE '%.com' → emails ending in .com.

-- 🔹 IS NULL / IS NOT NULL

-- NULL = missing or unknown value.

-- WHERE email IS NULL → find users with no email.

-- WHERE email IS NOT NULL → find users that have an email.

-- Make sure you're in the right DB
USE myshopday2;

-- Update existing rows with order_date;
UPDATE Orders SET order_date = '2023-12-28' WHERE user_id = 101;
UPDATE Orders SET order_date = '2024-01-05' WHERE user_id = 101;
UPDATE Orders SET order_date = '2024-03-15' WHERE user_id = 102;
UPDATE Orders SET order_date = '2024-05-22' WHERE user_id = 103;
UPDATE Orders SET order_date = NULL WHERE user_id = 104;
UPDATE Orders SET order_date = '2024-07-10' WHERE user_id = 105;

-- Query: Orders That Are Not Null and Placed in 2024
SELECT order_id, product_name, order_date
FROM Orders
WHERE order_date is NOT NULL AND order_date BETWEEN '24-01-01' AND '24-12-31';

-- Orders that are either "Phone" or "Laptop"
SELECT *
FROM Orders
where product_name IN ('Phone', 'Laptop');

-- Orders placed by users not equal to 101 (Mary)
SELECT *
FROM Orders
WHERE NOT user_id = 101

-- Orders where product starts with 'S'
SELECT *
FROM Orders
WHERE product_name LIKE 'S%'