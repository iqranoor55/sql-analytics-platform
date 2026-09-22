-- find discontinued products
SELECT * 
FROM products
WHERE discontinued=1;
--products between price 10 and 20
SELECT * 
FROM products
WHERE unit_price BETWEEN 10 AND 20;
--  customers from Germany
SELECT contact_name,city 
FROM customers
WHERE country='Germany';
-- orders from 1997
SELECT * 
FROM orders
WHERE EXTRACT(YEAR  FROM order_date) = 1997;
-- products with names containing 'chef'
SELECT * 
FROM products
WHERE product_name ILIKE '%chef%';
--  orders sorted by freight descending
SELECT *
FROM orders
ORDER BY freight DESC;
