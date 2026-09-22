SELECT COUNT (*) 
FROM orders;   
SELECT COunt(DISTINCT category_name)  
FROM categories;
--count orders per customer
SELECT contact_name,customers.customer_id,COUNT(order_id)
FROM customers
JOIN orders
ON customers.customer_id=orders.customer_id
GROUP BY customers.contact_name,customers.customer_id;
-- total revenue per product category
SELECT 
    c.category_name, 
    ROUND(SUM(od.unit_price * od.quantity*(1-od.discount))::NUMERIC,2) AS Total_revenue
FROM categories c
JOIN products  p ON c.category_id=p.category_id
JOIN order_details  od ON p.product_id=od.product_id
GROUP BY c.category_name;
-- customers with more than 5 orders
SELECT 
    c.customer_id, 
    c.contact_name, 
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.contact_name
HAVING COUNT(o.order_id) > 5
ORDER BY total_orders DESC;
--categories with average price above 30
SELECT 
    c.category_name,
    ROUND(AVG(p.unit_price)::numeric, 2) AS average_price
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING AVG(p.unit_price) > 30
ORDER BY average_price DESC;
--top 5 revenue-generating products.
SELECT 
    p.product_id,
    p.product_name,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;
