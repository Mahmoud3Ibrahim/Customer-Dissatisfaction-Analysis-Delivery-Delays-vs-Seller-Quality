CREATE SCHEMA IF NOT EXISTS analytics;

DROP TABLE IF EXISTS analytics.fact_orders_master;

CREATE TABLE analytics.fact_orders_master (
order_id TEXT,
order_item_id INTEGER,
product_id TEXT,
seller_id TEXT,
  shipping_limit_date TIMESTAMP,
  price NUMERIC,
  freight_value NUMERIC,
  product_category_name TEXT,
  customer_id TEXT,
  order_status TEXT,
  order_purchase_timestamp TIMESTAMP,
  order_approved_at TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP,
  delivery_time_days NUMERIC,
  is_delayed BOOLEAN,
  order_revenue NUMERIC,
  review_score NUMERIC,
  is_low_rating BOOLEAN,
  item_total_value NUMERIC
);