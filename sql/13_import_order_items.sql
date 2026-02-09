SET search_path TO analytics, public;

DROP TABLE IF EXISTS analytics.order_items_raw;

CREATE TABLE analytics.order_items_raw (
    order_id TEXT,
    order_item_id INT,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TIMESTAMP,
    price NUMERIC,
    freight_value NUMERIC
);
