-- =====================================================
-- Cafe Sales Analysis
-- Q2: How do sales change month by month?
-- =====================================================

USE master_ebis;

-- 2a. Monthly trend (chronological order)
-- Shows how revenue evolves over time. Useful for a line chart in Power BI.
SELECT
    DATE_FORMAT(fecha_limpia, '%Y-%m')   AS month,
    COUNT(*)                             AS transactions,
    ROUND(SUM(`Total Spent`), 2)         AS total_revenue
FROM dirty_cafe_sales
WHERE fecha_limpia IS NOT NULL
GROUP BY month
ORDER BY month;


-- 2b. Best and worst months (ranked by revenue)
-- Answers: which month generated the most revenue?
SELECT
    DATE_FORMAT(fecha_limpia, '%Y-%m')   AS month,
    COUNT(*)                             AS transactions,
    ROUND(SUM(`Total Spent`), 2)         AS total_revenue,
    ROUND(AVG(`Total Spent`), 2)         AS avg_ticket
FROM dirty_cafe_sales
WHERE fecha_limpia IS NOT NULL
GROUP BY month
ORDER BY total_revenue DESC;