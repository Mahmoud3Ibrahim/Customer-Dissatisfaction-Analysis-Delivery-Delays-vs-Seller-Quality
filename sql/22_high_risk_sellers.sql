  SELECT
    seller_id, seller_city, seller_state,
    delivered_orders, delayed_pct, avg_late_days,
    reviewed_orders, avg_review_score, low_score_pct,
    risk_bucket
  FROM analytics.v_seller_watchlist_named
  WHERE risk_bucket = 'High Risk'
  ORDER BY (delayed_pct + low_score_pct) DESC, delivered_orders DESC
