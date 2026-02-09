SET search_path TO analytics, public;

DROP TABLE IF EXISTS analytics.order_reviews_raw;

CREATE TABLE analytics.order_reviews_raw (
    review_id TEXT,
    order_id TEXT,
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);
