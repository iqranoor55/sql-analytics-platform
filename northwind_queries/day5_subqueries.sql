-- products more expensive than average
SELECT 
    product_id,
    product_name, 
    unit_price
FROM products
WHERE unit_price > (
    SELECT AVG(unit_price) 
    FROM products
);
--  customers who ordered product X
SELECT 
    customer_id, 
    contact_name
FROM customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    WHERE p.product_name = 'Chai'
);
