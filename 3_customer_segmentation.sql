-- 📦 Customer Segmentation by Frequency & Basket Diversity
-- 📌 Purpose: Segment users into behavioral cohorts using purchase frequency and product diversity

-- ------------------------------------------------------
-- 👥 Build User Metrics
-- 🔹 Goal: Calculate number of distinct orders and distinct products per user

WITH user_metrics AS (
    SELECT
        o.user_id,
        COUNT(DISTINCT o.order_id)      AS frequency,          -- Total number of orders placed
        COUNT(DISTINCT op.product_id)   AS product_diversity   -- Number of unique products purchased
    FROM orders o
    JOIN order_products__prior op
        ON o.order_id = op.order_id
    GROUP BY o.user_id
),

-- ------------------------------------------------------
-- 🔢 Rank into Quartiles
-- 🔹 Goal: Classify users into quartiles for both frequency and diversity

user_quartiles AS (
    SELECT
        user_id,
        frequency,
        product_diversity,
        NTILE(4) OVER (ORDER BY frequency)         AS freq_quartile,     -- 1 = lowest 25%, 4 = highest 25%
        NTILE(4) OVER (ORDER BY product_diversity) AS div_quartile
    FROM user_metrics
),

-- ------------------------------------------------------
-- 🏷️ Label Customer Segments
-- 🔹 Goal: Assign each user to a behavioral segment based on their quartile ranks

segmented_users AS (
    SELECT
        user_id,
        CASE
            WHEN freq_quartile >= 3 AND div_quartile >= 3 THEN 'Frequent & Diverse'
            WHEN freq_quartile >= 3 THEN 'Frequent Only'
            WHEN div_quartile >= 3 THEN 'Diverse Only'
            ELSE 'Occasional / Narrow'
        END AS customer_segment
    FROM user_quartiles
)

-- ------------------------------------------------------
-- 📊 Aggregate & Compute Distribution
-- 🔹 Goal: Count users per segment and compute their percentage of the total user base

SELECT
    customer_segment,
    COUNT(*) AS customer_count,
    CAST(100.0 * COUNT(*) / SUM(COUNT(*)) OVER() AS DECIMAL(5,2)) AS percent_customers
FROM segmented_users
GROUP BY customer_segment
ORDER BY customer_count DESC;
