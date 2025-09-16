-- 📅 Day 7 (Tue): GROUP BY & HAVING
-- 🔹 Why GROUP BY?

-- Aggregation (Day 6) summarized the whole table into one result (like total users).

-- But what if we want summaries per group?
-- Example: “How many users are there in each country?”

-- That’s where GROUP BY comes in.
USE myshopday2;

ALTER Users
ADD COLUMN country VARCHAR(50);

-- Update existing rows with registration_dates
UPDATE Users set country = 'Nigeria' WHERE user_id = 101;
UPDATE Users set country = 'United State' WHERE user_id = 102;
UPDATE Users set country = 'Nigeria' WHERE user_id = 103;
UPDATE Users set country = 'United State' WHERE user_id = 104;
UPDATE Users set country = 'Nigeria' WHERE user_id = 105;
UPDATE Users set country = 'Niger' WHERE user_id = 106;

-- 1. GROUP BY

-- Tells SQL to split rows into groups based on one or more columns.

-- Then, you can apply aggregate functions (COUNT, SUM, AVG, etc.) to each group.


SELECT country, count(*) AS user_count
from Users
GROUP BY country;

-- 🔍 Explanation:

-- SELECT country, COUNT(*)

-- We want the country name and how many users are in each.

-- FROM Users → look inside Users table.

-- GROUP BY country → SQL will:

-- Take all rows.

-- Group them by country.

-- Apply COUNT(*) within each group.


-- 2. HAVING

-- WHERE filters before grouping.

-- HAVING filters after grouping (when you already have counts, sums, etc.).

SELECT country, COUNT(*) AS user_count
from Users
GROUP BY country
HAVING COUNT(*) > 2

-- 🔍 Explanation:

-- GROUP BY country → makes groups.

-- COUNT(*) → counts each group’s size.

-- HAVING COUNT(*) > 10 → only keep groups with more than 10 users.

-- 👉 If Nigeria had 25 users, and Ghana only 8, the result would be:

-- country	user_count
-- Nigeria	25

-- ⚡ Key difference between WHERE and HAVING

-- WHERE → filters rows (before grouping).

-- HAVING → filters groups (after aggregation).