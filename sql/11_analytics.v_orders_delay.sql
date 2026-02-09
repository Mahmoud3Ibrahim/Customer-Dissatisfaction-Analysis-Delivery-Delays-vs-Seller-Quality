DROP VIEW IF EXISTS analytics.v_orders_delay;

CREATE OR REPLACE VIEW analytics.v_orders_delay AS
SELECT
    order_id,
    customer_id,
    (order_delivered_customer_date::date - order_estimated_delivery_date::date) AS delivery_delay_days
FROM analytics.orders_raw
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;

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