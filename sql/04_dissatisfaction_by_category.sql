SELECT
  COALESCE(product_category_name, 'unknown') AS product_category,
  COUNT(DISTINCT order_id) AS orders_count,
  ROUND(100.0 * AVG(CASE WHEN is_delayed THEN 1 ELSE 0 END), 2) AS delay_pct,
  ROUND(100.0 * AVG(CASE WHEN is_low_rating THEN 1 ELSE 0 END), 2) AS low_rating_pct
FROM analytics.fact_orders_master
GROUP BY 1
ORDER BY orders_count DESC;