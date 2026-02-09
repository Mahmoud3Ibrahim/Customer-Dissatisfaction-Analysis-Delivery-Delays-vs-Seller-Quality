DROP TABLE IF EXISTS analytics.orders_raw;

CREATE TABLE analytics.orders_raw (
    order_id                         TEXT,
    customer_id                      TEXT,
    order_status                     TEXT,
    order_purchase_timestamp         TIMESTAMP WITHOUT TIME ZONE,
    order_approved_at                TIMESTAMP WITHOUT TIME ZONE,
    order_delivered_carrier_date     TIMESTAMP WITHOUT TIME ZONE,
    order_delivered_customer_date    TIMESTAMP WITHOUT TIME ZONE,
    order_estimated_delivery_date    TIMESTAMP WITHOUT TIME ZONE
);