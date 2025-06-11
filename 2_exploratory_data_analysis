-- 📊 Exploratory Data Analysis (EDA)
-- 📌 Purpose: Understand customer behavior and shopping trends through SQL-based EDA

-- ----------------------------------------
-- 👥 User & Order Overview
-- 🔹 Goal: Determine the total number of customers, orders, and products

-- Total number of unique users
SELECT
    COUNT(DISTINCT user_id) AS total_customers
FROM orders;

-- Total number of unique orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- Total number of available products
SELECT
    COUNT(*) AS total_products
FROM products;

-- ----------------------------------------
-- 🛒 Top 10 Most Popular Products
-- 🔹 Goal: Identify the most frequently purchased products

SELECT TOP 10
    p.product_id,
    p.product_name,
    COUNT(*) AS total_orders
FROM order_products__prior op
JOIN products p ON op.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_orders DESC;

-- ----------------------------------------
-- 🏬 Top 10 Most Popular Departments
-- 🔹 Goal: Find which departments generate the highest order volumes

SELECT TOP 10
    d.department_id,
    d.department,
    COUNT(*) AS total_orders
FROM order_products__prior op
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department_id, d.department
ORDER BY total_orders DESC;

-- ----------------------------------------
-- 🔁 Reorder Behavior
-- 🔹 Goal: Understand how often users reorder vs. purchase new products

SELECT
    reordered,                     -- 0 = new order, 1 = reorder
    COUNT(*) AS count
FROM order_products__prior
GROUP BY reordered;
