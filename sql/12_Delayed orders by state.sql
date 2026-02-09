SELECT
    c.customer_state,
    COUNT(*) AS delivered_orders,
    COUNT(*) FILTER (WHERE d.delivery_delay_days > 0) AS delayed_orders,
    ROUND(100.0 * COUNT(*) FILTER (WHERE d.delivery_delay_days > 0) / COUNT(*), 2) AS delayed_pct,
    ROUND(AVG(d.delivery_delay_days) FILTER (WHERE d.delivery_delay_days > 0)::numeric, 2) AS avg_late_days
FROM analytics.v_orders_delay d
JOIN analytics.customers_raw c
  ON c.customer_id = d.customer_id
GROUP BY c.customer_state
HAVING COUNT(*) >= 100
ORDER BY delayed_pct DESC, delivered_orders DESC;