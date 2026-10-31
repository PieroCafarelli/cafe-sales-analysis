USE master_ebis;

-- Q1: Revenue and units sold by product
SELECT
    `Item`                          AS product,
    COUNT(*)                        AS transactions,
    SUM(`Quantity`)                 AS units_sold,
    ROUND(SUM(`Total Spent`), 2)    AS total_revenue
FROM dirty_cafe_sales
WHERE `Item` IS NOT NULL
GROUP BY `Item`
ORDER BY total_revenue DESC;

