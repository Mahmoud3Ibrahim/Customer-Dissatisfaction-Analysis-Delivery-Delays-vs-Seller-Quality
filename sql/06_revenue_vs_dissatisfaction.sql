-- Revenue proxy: item_total_value aggregated by category (order-level)
WITH orders_cat AS (
  SELECT DISTINCT
    order_id,
    COALESCE(product_category_name, 'unknown') AS product_category,
    is_low_rating
  FROM analytics.fact_orders_master
),
revenue_cat AS (
  SELECT
    COALESCE(product_category_name, 'unknown') AS product_category,
    SUM(item_total_value) AS total_item_value
  FROM analytics.fact_orders_master
  GROUP BY 1
),
stats AS (
  SELECT
    product_category,
    COUNT(*) AS orders_count,
    ROUND(100.0 * AVG(CASE WHEN is_low_rating THEN 1 ELSE 0 END), 2) AS low_rating_pct
  FROM orders_cat
  GROUP BY 1
)
SELECT
  s.product_category,
  s.orders_count,
  s.low_rating_pct,
  ROUND(r.total_item_value, 2) AS total_item_value
FROM stats s
JOIN revenue_cat r USING (product_category)
ORDER BY total_item_value DESC;