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
-- most expensive product in each category,
SELECT 
    p1.category_id,
    p1.product_name,
    p1.unit_price
FROM products p1
WHERE p1.unit_price = (
    SELECT MAX(p2.unit_price)
    FROM products p2
    WHERE p2.category_id = p1.category_id
)
ORDER BY p1.category_id;
--customers who never placed an order
SELECT 
    customer_id, 
    contact_name
FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id 
    FROM orders 
    WHERE customer_id IS NOT NULL
);

 