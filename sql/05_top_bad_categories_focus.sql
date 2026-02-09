-- Focus categories: enough volume + high dissatisfaction
WITH orders_cat AS (
  SELECT DISTINCT
    order_id,
    COALESCE(product_category_name, 'unknown') AS product_category,
    is_delayed,
    is_low_rating
  FROM analytics.fact_orders_master
),
stats AS (
  SELECT
    product_category,
    COUNT(*) AS orders_count,
    ROUND(100.0 * AVG(CASE WHEN is_delayed THEN 1 ELSE 0 END), 2) AS delay_pct,
    ROUND(100.0 * AVG(CASE WHEN is_low_rating THEN 1 ELSE 0 END), 2) AS low_rating_pct
  FROM orders_cat
  GROUP BY 1
)
SELECT *
FROM stats
WHERE orders_count >= 500
ORDER BY low_rating_pct DESC, delay_pct DESC;