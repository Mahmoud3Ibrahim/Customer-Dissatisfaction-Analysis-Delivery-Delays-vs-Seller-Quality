DROP TABLE IF EXISTS analytics.kpi_seller_watchlist;

CREATE TABLE analytics.kpi_seller_watchlist AS
SELECT
    d.seller_id,
    d.delivered_orders,
    d.delayed_pct,
    d.avg_late_days,
    q.reviewed_orders,
    q.avg_review_score,
    q.low_score_pct,
    CASE
        WHEN d.delayed_pct >= 10 AND q.low_score_pct >= 20 THEN 'High Risk'
        WHEN d.delayed_pct >= 10 OR  q.low_score_pct >= 20 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_bucket
FROM analytics.kpi_seller_delay d
JOIN analytics.kpi_seller_quality q
  ON q.seller_id = d.seller_id;


