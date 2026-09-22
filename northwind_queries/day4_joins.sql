-- products with their category names
SELECT category_name,product_name
FROM categories
JOIN products
ON categories.category_id=products.category_id;
--orders with customer names,
SELECT contact_name,order_id
FROM customers
JOIN orders
ON customers.customer_id=orders.customer_id;
-- products never ordered (LEFT JOIN + IS NULL)
SELECT product_name,order_id
FROM products
LEFT JOIN order_details
ON products.product_id=order_details.product_id
WHERE order_id is NULL;

--Employees with their Managers (The Self Join )
SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    m.first_name || ' ' || m.last_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.reports_to = m.employee_id;
-- orders with product and customer details in one query
SELECT o.order_id,
    o.order_date,
    c.customer_id,
    c.contact_name AS customer_name,
    p.product_name,
    od.unit_price,
    od.quantity
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
JOIN  order_details od ON od.order_id=o.order_id
JOIN products p ON od.product_id = p.product_id
ORDER BY o.order_id;
