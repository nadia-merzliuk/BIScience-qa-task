-- Task 3 - SQL queries
-- Tested on SQLite with the sample data from the task (seed.sql / ecommerce.db).
--
-- Schema:
--   Products(id, name, category, price, stock)
--   Orders(id, product_id, user_id, quantity, order_date)
--   Users(id, name, email)


-- 1. Products in the "electronics" category for a user
--
-- I read "for a user" as the electronics products that this user has ordered
-- (products are linked to users only through Orders).
-- DISTINCT: a user can order the same product more than once.
-- LOWER(): the task says "electronics", but the data has "Electronics".

-- 1a. User by id
SELECT DISTINCT p.id, p.name, p.category, p.price
FROM Products p
JOIN Orders o ON o.product_id = p.id
JOIN Users  u ON u.id = o.user_id
WHERE LOWER(p.category) = LOWER('Electronics')
  AND u.id = 1                      -- change the user here
ORDER BY p.name;

-- 1b. User by name (same result here, but names are not unique in general)
SELECT DISTINCT p.id, p.name, p.category, p.price
FROM Products p
JOIN Orders o ON o.product_id = p.id
JOIN Users  u ON u.id = o.user_id
WHERE LOWER(p.category) = LOWER('Electronics')
  AND u.name = 'Alice Johnson'      -- change the user here
ORDER BY p.name;

-- If "for a user" just means the electronics catalog (not tied to orders):
--
-- SELECT id, name, category, price, stock
-- FROM Products
-- WHERE LOWER(category) = LOWER('Electronics')
-- ORDER BY name;


-- 2. Total quantity ordered for each product
--
-- LEFT JOIN + COALESCE so that products without orders are still listed (with 0).
-- SUM(quantity), not COUNT(*): we need the number of units, not the number of orders.

SELECT p.id,
       p.name,
       p.category,
       COALESCE(SUM(o.quantity), 0) AS total_quantity_ordered
FROM Products p
LEFT JOIN Orders o ON o.product_id = p.id
GROUP BY p.id, p.name, p.category
ORDER BY total_quantity_ordered DESC, p.name;


-- Results on the sample data:
--
-- 1a / 1b (user 1, Alice Johnson): Laptop, Smartphone
--
-- 2:  Headphones    6
--     Desk Lamp     4
--     Smartphone    4
--     Laptop        2
--     Office Chair  2
