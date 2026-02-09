-- Basic sanity checks
SELECT
  COUNT(*) AS rows_items,
  COUNT(DISTINCT order_id) AS distinct_orders,
  ROUND(COUNT(*)::numeric / COUNT(DISTINCT order_id), 2) AS avg_items_per_order
FROM analytics.fact_orders_master;

SELECT
  COUNT(*) FILTER (WHERE order_id IS NULL) AS null_order_id,
  COUNT(*) FILTER (WHERE price IS NULL) AS null_price,
  COUNT(*) FILTER (WHERE order_purchase_timestamp IS NULL) AS null_purchase_ts,
  COUNT(*) FILTER (WHERE is_delayed IS NULL) AS null_is_delayed,
  COUNT(*) FILTER (WHERE review_score IS NULL) AS null_review_score
FROM analytics.fact_orders_master;