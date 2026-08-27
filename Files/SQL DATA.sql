CREATE DATABASE ecommerce_capstone;
USE ecommerce_capstone;
SHOW DATABASES;

SELECT count(*)  AS total_customers
FROM Customers;

SELECT *
FROM customers
LIMIT 5;

SELECT count(*) total_orders
FROM orders; 

SELECT *
FROM orders
LIMIT 5;

SELECT 
COUNT(*) AS total_orders,
SELECT
    COUNT(*) AS total_orders,
    SUM(order_approved_at IS NULL) AS missing_approved,
    SUM(order_delivered_shipping_date IS NULL) AS missing_shipping,
    SUM(order_delivered_customer_date IS NULL) AS missing_customer_delivery,
    SUM(order_estimated_delivery_date IS NULL) AS missing_estimated
FROM orders;

SELECT
    COUNT(*) AS total_orders,

    SUM(order_approved_at = '') AS blank_approved,
    SUM(order_delivered_shipping_date = '') AS blank_shipping,
    SUM(order_delivered_customer_date = '') AS blank_customer_delivery,
    SUM(order_estimated_delivery_date = '') AS blank_estimated

FROM orders;


DESCRIBE orders;
SET SQL_SAFE_UPDATES = 1;
UPDATE orders
SET order_approved_at = NULL
WHERE order_approved_at = '' AND order_id IS NOT NULL;

UPDATE orders
SET order_delivered_shipping_date = NULL
WHERE order_delivered_shipping_date = '' AND order_id IS NOT NULL;

UPDATE orders
SET order_delivered_customer_date = NULL
WHERE order_delivered_customer_date = '' AND order_id IS NOT NULL;

UPDATE orders
SET order_estimated_delivery_date = NULL
WHERE order_estimated_delivery_date = '' AND order_id IS NOT NULL


ALTER TABLE orders
MODIFY order_purchase_timestamp DATETIME NULL;

ALTER TABLE orders
MODIFY order_approved_at DATETIME NULL;

ALTER TABLE orders
MODIFY order_delivered_shipping_date DATETIME NULL;

ALTER TABLE orders
MODIFY order_delivered_customer_date DATETIME NULL;

ALTER TABLE orders
MODIFY order_estimated_delivery_date DATETIME NULL;

DESCRIBE orders;

SELECT count(*)  AS total_order_items
FROM order_items;

select *
from order_items
limit 5;

describe order_items;
DROP TABLE IF EXISTS reviews;

CREATE TABLE order_items (
order_item_id VARCHAR(50),
order_id VARCHAR(50),
product_id VARCHAR(50),
quantity INT,
unit_price DOUBLE,
discount_percent DOUBLE,
shipping_cost DOUBLE
);
SET GLOBAL local_infile = 1;

DROP TABLE order_items;

CREATE TABLE products (
product_id VARCHAR(50),
Category_name VARCHAR(100),
sub_category_name VARCHAR(100),
product_weight_g INT,
brand VARCHAR(100),
cost_price DOUBLE,
selling_price DOUBLE,
stock_availability VARCHAR(50)
);

CREATE TABLE reviews (
review_id VARCHAR(50),
order_id VARCHAR(50),
review_score INT,
review_comment_message TEXT,
review_date VARCHAR(50)
);

CREATE TABLE geolocation (
geolocation_zip_code VARCHAR(50),
geolocation_city VARCHAR(100),
geolocation_state VARCHAR(100),
geolocation_lat DOUBLE,
geolocation_lng DOUBLE,
region VARCHAR(50)
);


SELECT
    COUNT(*) AS total_rows,
    SUM(order_item_id IS NULL) AS missing_item_id,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(product_id IS NULL) AS missing_product_id,
    SUM(unit_price IS NULL) AS missing_unit_price,
    SUM(discount_percent IS NULL) AS missing_discount,
    SUM(shipping_cost IS NULL) AS missing_shipping
FROM order_items;

SELECT
    SUM(quantity < 0) AS negative_quantity,
    SUM(unit_price < 0) AS negative_unit_price,
    SUM(discount_percent < 0) AS negative_discount,
    SUM(shipping_cost < 0) AS negative_shipping
FROM order_items;



SELECT
    COUNT(*) AS total_products,
    SUM(product_id IS NULL) AS missing_product_id,
    SUM(Category_name IS NULL) AS missing_category,
    SUM(sub_category_name IS NULL) AS missing_subcategory,
    SUM(product_weight_g IS NULL) AS missing_weight,
    SUM(brand IS NULL) AS missing_brand,
    SUM(cost_price IS NULL) AS missing_cost,
    SUM(selling_price IS NULL) AS missing_selling,
    SUM(stock_availability IS NULL) AS missing_stock
FROM products;



SELECT
    SUM(profit < 0) AS negative_profit,
    SUM(profit = 0) AS zero_profit
FROM products;

SELECT
    product_id,
    selling_price - cost_price AS profit
FROM products;

SELECT
    product_id,
    ((selling_price - cost_price) / selling_price) * 100 AS profit_margin
FROM products;

SELECT
    COUNT(*) AS total_reviews,
    SUM(review_id IS NULL) AS missing_review_id,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(review_score IS NULL) AS missing_score,
    SUM(review_comment_message IS NULL) AS missing_comment,
    SUM(review_date IS NULL) AS missing_date
FROM reviews;


SELECT
    MIN(review_score) AS min_score,
    MAX(review_score) AS max_score,
    SUM(review_score < 1 OR review_score > 5) AS invalid_scores
FROM reviews;

SELECT COUNT(*) AS future_reviews
FROM reviews
WHERE review_date > CURRENT_DATE;

SELECT
    COUNT(*) AS total_rows,
    SUM(geolocation_zip_code IS NULL) AS missing_zip,
    SUM(geolocation_city IS NULL) AS missing_city,
    SUM(geolocation_state IS NULL) AS missing_state,
    SUM(geolocation_lat IS NULL) AS missing_lat,
    SUM(geolocation_lng IS NULL) AS missing_lng,
    SUM(region IS NULL) AS missing_region
FROM geolocation;

SELECT
    SUM(geolocation_lat < -90 OR geolocation_lat > 90) AS invalid_latitude,
    SUM(geolocation_lng < -180 OR geolocation_lng > 180) AS invalid_longitude
FROM geolocation;

SELECT
COUNT(*) AS total_rows,
SUM(CASE WHEN geolocation_zip_code IS NULL OR geolocation_zip_code = '' THEN 1 ELSE 0 END) AS missing_zip,
SUM(CASE WHEN geolocation_city IS NULL OR geolocation_city = '' THEN 1 ELSE 0 END) AS missing_city,
SUM(CASE WHEN geolocation_state IS NULL OR geolocation_state = '' THEN 1 ELSE 0 END) AS missing_state,
SUM(CASE WHEN geolocation_lat IS NULL THEN 1 ELSE 0 END) AS missing_lat,
SUM(CASE WHEN geolocation_lng IS NULL THEN 1 ELSE 0 END) AS missing_lng,
SUM(CASE WHEN region IS NULL OR region = '' THEN 1 ELSE 0 END) AS missing_region
FROM geolocation;


SELECT COUNT(*) AS unmatched_customers
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT COUNT(*) AS unmatched_orders
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT COUNT(*) AS unmatched_products
FROM order_items oi
LEFT JOIN products p 
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

SELECT COUNT(*) AS unmatched_orders
FROM reviews r
LEFT JOIN orders o
ON r.order_id = o.order_id
WHERE o.order_id IS NULL; 

