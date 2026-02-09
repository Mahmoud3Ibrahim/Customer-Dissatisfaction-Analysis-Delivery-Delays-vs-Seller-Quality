CREATE OR REPLACE VIEW analytics.v_seller_watchlist_named AS
SELECT
    w.seller_id,
    s.seller_city,
    s.seller_state,
    w.delivered_orders,
    w.delayed_pct,
    w.avg_late_days,
    w.reviewed_orders,
    w.avg_review_score,
    w.low_score_pct,
    w.risk_bucket
FROM analytics.kpi_seller_watchlist w
LEFT JOIN analytics.sellers_raw s
  ON s.seller_id = w.seller_id;

SELECT
  seller_id,
  seller_city,
  seller_state,
  delivered_orders,
  delayed_pct,
  avg_late_days,
  reviewed_orders,
  avg_review_score,
  low_score_pct,
  risk_bucket
FROM analytics.v_seller_watchlist_named
WHERE risk_bucket = 'High Risk'
ORDER BY
  (delayed_pct + low_score_pct) DESC,
  delivered_orders DESC
LIMIT 50;