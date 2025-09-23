-- 📅 Day 7 (Tue): GROUP BY & HAVING
-- 🔹 Why GROUP BY?

-- Aggregation (Day 6) summarized the whole table into one result (like total users).

-- But what if we want summaries per group?
-- Example: “How many users are there in each country?”

-- That’s where GROUP BY comes in.
USE myshopday2;

ALTER TABLE Users
ADD COLUMN country VARCHAR(50);

-- Update existing rows with registration_dates
UPDATE Users set country = 'Nigeria' WHERE user_id = 101;
UPDATE Users set country = 'United State' WHERE user_id = 102;
UPDATE Users set country = 'Nigeria' WHERE user_id = 103;
UPDATE Users set country = 'United State' WHERE user_id = 104;
UPDATE Users set country = 'Nigeria' WHERE user_id = 105;
UPDATE Users set country = 'Niger' WHERE user_id = 106;
DESCRIBE Users;

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





-- ⚡ SQL Query Execution Order

-- Even though we write SQL in this order:

-- SELECT ...
-- FROM ...
-- WHERE ...
-- GROUP BY ...
-- HAVING ...
-- ORDER BY ...
-- LIMIT ...


-- SQL actually executes it in this order:

-- FROM

-- Load the table(s) you’re working with.

-- Apply JOINs if multiple tables are involved.

-- WHERE

-- Filter out rows before grouping (row-level filtering).

-- GROUP BY

-- Split the remaining rows into groups based on specified column(s).

-- HAVING

-- Filter out groups based on aggregate conditions (like COUNT > 10).

-- SELECT

-- Decide which columns or aggregate results to display.

-- Apply aliases (AS).

-- ORDER BY

-- Sort the final result.

-- LIMIT

-- Restrict the number of rows shown (e.g., first 10).
 
-- 📊 Visual Flow Diagram
-- FROM (get data) 
--    ↓
-- WHERE (filter rows)
--    ↓
-- GROUP BY (make groups)
--    ↓
-- HAVING (filter groups)
--    ↓
-- SELECT (choose columns/aggregates)
--    ↓
-- ORDER BY (sort results)
--    ↓
-- LIMIT (final cut)

-- ✅ Example Query with Flow
-- SELECT country, COUNT(*) AS user_count
-- FROM Users
-- WHERE birth_date > '2000-01-01'       -- Step 2: filter rows
-- GROUP BY country                      -- Step 3: group remaining rows
-- HAVING COUNT(*) > 10                  -- Step 4: filter groups
-- ORDER BY user_count DESC              -- Step 6: sort groups
-- LIMIT 5;                              -- Step 7: top 5 results

-- Execution explained:

-- FROM Users → load all users.

-- WHERE birth_date > '2000-01-01' → only users born after 2000.

-- GROUP BY country → group those users by country.

-- HAVING COUNT(*) > 10 → keep only countries with more than 10 such users.

-- SELECT country, COUNT(*) → output country + number of users.

-- ORDER BY user_count DESC → largest groups first.

-- LIMIT 5 → show only the top 5 countries.

-- 👉 That’s why:

-- You can’t use HAVING without GROUP BY (unless forcing an aggregate).

-- You can’t reference an alias in WHERE, because SELECT runs later.

-- Would you like me to prepare a small practice exercise where you try to guess what the query output will be, step by step, so you can test your understanding of this execution flow?

-- You said:
-- yes
-- ChatGPT said:

-- Nice 💡 Let’s make this interactive. I’ll give you a small dataset + a query. You’ll try to reason step by step using the execution order we just covered. Then I’ll reveal the answer.

-- 📊 Sample Users Table
-- user_id	name	country	birth_date	registration_date
-- 1	Alice	Nigeria	1995-05-10	2023-03-14
-- 2	David	Ghana	2001-07-22	2024-01-10
-- 3	John	Nigeria	2002-11-02	2024-05-10
-- 4	Sarah	Kenya	2005-08-11	2024-02-01
-- 5	Mary	Nigeria	1999-09-01	2024-06-22
-- 6	Peter	Ghana	2003-12-15	2024-07-05
-- 📝 Query to Analyze
-- SELECT country, COUNT(*) AS user_count
-- FROM Users
-- WHERE birth_date > '2000-01-01'
-- GROUP BY country
-- HAVING COUNT(*) > 1
-- ORDER BY user_count DESC;

-- ❓ Your Turn

-- Walk through the steps in your head (or write them out):

-- FROM → start with Users table.

-- WHERE → filter users born after 2000.

-- GROUP BY → group by country.

-- HAVING → only keep groups with more than 1 user.

-- SELECT → show country + count.

-- ORDER BY → sort results by user_count (descending).

-- 👉 Based on this, what do you think the final table (output) will look like?