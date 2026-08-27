USE ecommerce_capstone;
LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/niit traning/project folder/Capstone Project/Cleaned Data CSV/Order_Items_Cleaned.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(order_item_id, order_id, quantity, product_id, unit_price, discount_percent, shipping_cost);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/niit traning/project folder/Capstone Project/Cleaned Data CSV/Products_Cleaned.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(product_id, Category_name, sub_category_name, product_weight_g, brand, cost_price, selling_price, stock_availability);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/niit traning/project folder/Capstone Project/Cleaned Data CSV/Reviews_Cleaned.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(review_id, order_id, review_score, review_comment_message, review_date);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/OneDrive/niit traning/project folder/Capstone Project/Cleaned Data CSV/Geolocation_Cleaned.csv'
INTO TABLE geolocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(geolocation_zip_code, geolocation_city, geolocation_state, geolocation_lat, geolocation_lng, region);


select count(*) as total_geo
from geolocation;

