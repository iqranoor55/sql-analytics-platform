SELECT customer_id , contact_name
FROM customers;
-- all products
SELECT * FROM products;
SELECT COUNT(*) FROM products;
--  products over price 20
SELECT * FROM products
WHERE unit_price > 20;
--  sorted by name
SELECT * FROM products
ORDER BY product_name;
-- sorted by name in descending order
SELECT * FROM products
ORDER BY product_name DESC;
-- top 10 by price
SELECT unit_price
FROM products
LIMIT 10;
