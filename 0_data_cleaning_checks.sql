-- 🔍 Data Quality Checks for Customer Segmentation Project
-- 📌 Purpose: Ensure uniqueness, consistency, and cleanliness of core tables before analysis

-- ----------------------------------------
-- ✅ 1. Check for Duplicate or NULL department_id in the departments table
-- This helps ensure every department is uniquely identified

SELECT
    department_id,
    COUNT(*) AS record_count
FROM [customer_segmentation_db].[dbo].[departments]
GROUP BY department_id
HAVING COUNT(*) > 1 OR department_id IS NULL;

-- ----------------------------------------
-- ✅ 2. Check for Duplicate or NULL order_id in the orders table
-- Duplicates in order IDs can cause joins and aggregations to break

SELECT
    order_id,
    COUNT(*) AS record_count
FROM [customer_segmentation_db].[dbo].[orders]
GROUP BY order_id
HAVING COUNT(*) > 1 OR order_id IS NULL;

-- ----------------------------------------
-- ✅ 3. Check for Duplicate or NULL product_id in the products table
-- Each product should have a unique and non-null ID

SELECT
    product_id,
    COUNT(*) AS record_count
FROM [customer_segmentation_db].[dbo].[products]
GROUP BY product_id
HAVING COUNT(*) > 1 OR product_id IS NULL;

-- ----------------------------------------
-- ✅ 4. Check for extra spaces in aisle names
-- Trimming whitespace avoids grouping/aggregation issues due to formatting errors

SELECT
    aisle
FROM [customer_segmentation_db].[dbo].[aisles]
WHERE aisle != TRIM(aisle);

-- ----------------------------------------
-- ✅ 5. Check for extra spaces in department names
-- Ensures clean text for reporting and filtering

SELECT
    department
FROM [customer_segmentation_db].[dbo].[departments]
WHERE department != TRIM(department);

-- ----------------------------------------
-- ✅ 6. Check for extra spaces in product names
-- Useful for consistent search and grouping

SELECT
    product_name
FROM [customer_segmentation_db].[dbo].[products]
WHERE product_name != TRIM(product_name);
