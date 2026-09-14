SELECT * 
FROM products
WHERE discontinued=1;
SELECT * 
FROM products
WHERE unit_price BETWEEN 10 AND 20;
SELECT contact_name,city 
FROM customers
WHERE country='Germany';
SELECT * 
FROM orders
WHERE EXTRACT(YEAR  FROM order_date) = 1997;
SELECT * 
FROM products
WHERE product_name ILIKE '%chef%';
SELECT *
FROM orders
ORDER BY freight DESC;
