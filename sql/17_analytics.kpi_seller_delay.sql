DROP TABLE IF EXISTS analytics.kpi_seller_delay;

CREATE TABLE analytics.kpi_seller_delay AS
SELECT
    oi.seller_id,
    COUNT(*) AS delivered_orders,
    COUNT(*) FILTER (WHERE d.delivery_delay_days > 0) AS delayed_orders,
    ROUND(100.0 * COUNT(*) FILTER (WHERE d.delivery_delay_days > 0) / COUNT(*), 2) AS delayed_pct,
    ROUND(AVG(d.delivery_delay_days) FILTER (WHERE d.delivery_delay_days > 0)::numeric, 2) AS avg_late_days
FROM analytics.v_orders_delay d
JOIN analytics.order_items_raw oi
  ON oi.order_id = d.order_id
GROUP BY oi.seller_id
HAVING COUNT(*) >= 20;


