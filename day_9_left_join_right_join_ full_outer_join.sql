USE myshopday2;

-- 1. LEFT JOIN

-- Returns all rows from the left table (Users), even if there’s no match in Orders.

-- If a user has no order, their Orders fields will be NULL.

SELECT Users.name, Orders.product_name
from Users
LEFT JOIN Orders
     ON Users.user_id = Orders.user_id;

--      ✅ Find users who haven’t made any orders

-- Now, we just add a filter:

SELECT Users.name
from Users
LEFT JOIN Orders
     on Users.user_id = Orders.user_id
WHERE Orders.order_id is NULL;

-- for me, I got no data but if you have ADD
-- a situation where people registered but they havent placed orders yet, ADDleft join will 
-- bring everyone out and the where orders.order_id is ull will now print out 
-- those who havnt places orders yet.

-- 2. RIGHT JOIN

-- Opposite of LEFT JOIN.

-- Returns all rows from the right table (Orders), even if no matching user exists.

-- If there’s an order with a user_id that doesn’t exist in Users (data inconsistency), the user side will be NULL.

SELECT Users.name, Orders.product_name
FROM Users
RIGHT JOIN Orders
    on Users.user_id = Orders.user_id

-- 3. FULL OUTER JOIN

-- Combines LEFT + RIGHT.

-- Shows all rows from both tables, even when there’s no match on either side.

-- Not supported natively in MySQL (but works in PostgreSQL, SQL Server, etc.).

-- In MySQL, you simulate it with UNION of LEFT and RIGHT joins.

SELECT Users.name, Orders.product_name
FROM Users
LEFT JOIN Orders
   on Users.user_id = Orders.user_id

UNION

SELECT Users.name, Orders.product_name
from Users
RIGHT JOIN Orders
  ON Users.user_id = Orders.user_id;

--   ⚡ Summary:

-- LEFT JOIN → keep all users, even without orders.

-- RIGHT JOIN → keep all orders, even if no user exists.

-- FULL JOIN → keep everything from both sides.

-- WHERE Orders.order_id IS NULL → detects users with no orders.