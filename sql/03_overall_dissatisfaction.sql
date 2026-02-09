-- Overall dissatisfaction + delay impact (order-level)
WITH orders AS (
  SELECT DISTINCT
    order_id,
    is_delayed,
    is_low_rating
  FROM analytics.fact_orders_master
)
SELECT
  COUNT(*) AS total_orders,
  ROUND(100.0 * AVG(CASE WHEN is_low_rating THEN 1 ELSE 0 END), 2) AS low_rating_pct,
  ROUND(100.0 * AVG(CASE WHEN is_delayed THEN 1 ELSE 0 END), 2) AS delayed_pct
FROM orders;

-- Low rating split by delay
WITH orders AS (
  SELECT DISTINCT
    order_id,
    is_delayed,
    is_low_rating
  FROM analytics.fact_orders_master
)
SELECT
  CASE WHEN is_delayed THEN 'Delayed' ELSE 'On-time' END AS delivery_group,
  COUNT(*) AS orders_count,
  ROUND(100.0 * AVG(CASE WHEN is_low_rating THEN 1 ELSE 0 END), 2) AS low_rating_pct
FROM orders
GROUP BY 1
ORDER BY 1;