DROP TABLE IF EXISTS analytics.kpi_seller_quality;

CREATE TABLE analytics.kpi_seller_quality AS
SELECT
    oi.seller_id,
    COUNT(*) AS reviewed_orders,
    ROUND(AVG(r.review_score)::numeric, 2) AS avg_review_score,
    COUNT(*) FILTER (WHERE r.review_score <= 2) AS low_score_orders,
    ROUND(100.0 * COUNT(*) FILTER (WHERE r.review_score <= 2) / COUNT(*), 2) AS low_score_pct
FROM analytics.order_reviews_raw r
JOIN analytics.order_items_raw oi
  ON oi.order_id = r.order_id
GROUP BY oi.seller_id
HAVING COUNT(*) >= 20;