-- Make sure you're in the right DB
USE myshopday2;

-- Add the new column (only if it doesn’t exist yet)
ALTER TABLE Users
ADD COLUMN birth_year INT;

-- Update existing rows with birth years
UPDATE Users SET birth_year = 1998 WHERE user_id = 101;
UPDATE Users SET birth_year = 2002 WHERE user_id = 102;
UPDATE Users SET birth_year = 2001 WHERE user_id = 103;
UPDATE Users SET birth_year = 1995 WHERE user_id = 104;
UPDATE Users SET birth_year = 2003 WHERE user_id = 105;
UPDATE Users SET birth_year = 1999 WHERE user_id = 106;

-- Check updated table
SELECT * FROM Users;

-- Query: User Born After 2000

SELECT name, birth_year
FROM Users
WHERE birth_year > 2000;

-- Users born in or before 2000
SELECT name, birth_year
FROM Users
where birth_year <= 2000

-- Users born exactly in 2001
SELECT name, birth_year
FROM Users
where birth_year = 2001

-- Users born between 1998 and 2002
SELECT name, birth_year
from Users
WHERE birth_year BETWEEN 1998 AND 2002
-- where birth_year <= 2002

DESCRIBE Users;


