-- 🏗️ Create Master Product Order View
-- 📌 Purpose: Consolidate orders, products, and metadata into a unified view for analysis

-- ✅ Creates a view combining orders with product, aisle, and department information
-- This serves as the foundation for EDA, segmentation, and churn analysis

CREATE VIEW vw_product_orders AS
SELECT
    o.order_id,
    o.user_id,
    o.order_number,
    o.order_dow,               -- Day of week when the order was placed
    o.order_hour_of_day,       -- Hour of the day the order was placed
    o.days_since_prior_order,  -- Days gap since previous order
    op.product_id,
    op.add_to_cart_order,      -- Position of the product in the shopping cart
    op.reordered,              -- Flag indicating whether the product was reordered
    p.product_name,
    a.aisle,
    d.department
FROM orders o
    -- Join order-product mapping table (prior orders only)
    JOIN order_products__prior op ON o.order_id = op.order_id
    -- Join product details
    JOIN products p ON op.product_id = p.product_id
    -- Join aisle metadata
    JOIN aisles a ON p.aisle_id = a.aisle_id
    -- Join department metadata
    JOIN departments d ON p.department_id = d.department_id;
