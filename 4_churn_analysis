-- 🔄 Churn Analysis: Identify Customers Inactive in the Last 30+ Days
-- 📌 Purpose: Segment users based on recency to support re-engagement and retention strategies

-- ------------------------------------------------------
-- 📦 4.1 Calculate Cumulative Days per User Since First Order
-- 🔹 Goal: For each user and order, compute the running total of days since their first order

WITH recency_calc AS (
    SELECT
        o.user_id,
        o.order_number,
        SUM(COALESCE(o.days_since_prior_order, 0)) 
            OVER (
                PARTITION BY o.user_id 
                ORDER BY o.order_number 
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            ) AS total_days
    FROM orders AS o
),

-- ------------------------------------------------------
-- 📅 4.2 Get Days Since the Most Recent Order Per User
-- 🔹 Goal: Identify how long each user has been inactive

last_order AS (
    SELECT
        user_id,
        MAX(total_days) AS days_since_last
    FROM recency_calc
    GROUP BY user_id
),

-- ------------------------------------------------------
-- 👥 4.3 Bucket Users into Active, At-Risk, and Churned
-- 🔹 Goal: Create churn buckets based on recency thresholds

bucketed_users AS (
    SELECT
        user_id,
        days_since_last,
        CASE
            WHEN days_since_last <= 30 THEN 'Active (0–30d)'
            WHEN days_since_last <= 60 THEN 'At-Risk (31–60d)'
            ELSE 'Churned (60+d)'
        END AS bucket
    FROM last_order
)

-- ------------------------------------------------------
-- 📊 4.4 Aggregate Bucket Counts and Calculate Metrics
-- 🔹 Goal: Summarize user count, % share, and average inactivity for each bucket

SELECT
    bucket,
    COUNT(*) AS user_count,
    CAST(100.0 * COUNT(*) / SUM(COUNT(*)) OVER() AS DECIMAL(5,2)) AS pct_users,
    AVG(days_since_last) AS avg_days_since
FROM bucketed_users
GROUP BY bucket
ORDER BY 
    CASE bucket
        WHEN 'Active (0–30d)' THEN 1
        WHEN 'At-Risk (31–60d)' THEN 2
        WHEN 'Churned (60+d)' THEN 3
    END;
