SET search_path TO analytics, public;

-- Delay per order (already have v_orders_delay)

DROP VIEW IF EXISTS analytics.v_orders_delay CASCADE;

CREATE VIEW analytics.v_orders_delay AS
SELECT
    order_id,
    customer_id,
    (order_delivered_customer_date::date - order_estimated_delivery_date::date) AS delivery_delay_days
FROM analytics.orders_raw
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;

-- Seller delay KPI
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
HAVING COUNT(*) >= 20
ORDER BY delayed_pct DESC, delivered_orders DESC;