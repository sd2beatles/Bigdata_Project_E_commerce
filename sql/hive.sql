hadoop fs -setrep -R 1 /


DROP TABLE IF EXISTS customers_dataset;

CREATE TABLE  customers_dataset (
 customer_id STRING,
 customer_unique_id STRING,
 customer_zip_code_prefix STRING,
 customer_city STRING,
 customer_state STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse'
TBLPROPERTIES("skip.header.line.count"="1");


CREATE TABLE order_dataset (
order_id  STRING,
customer_id STRING,
order_status STRING,
order_purchase_timestamp TIMESTAMP,
order_approved_at TIMESTAMP,
order_delivered_carrier_date TIMESTAMP,
order_delivered_customer_date TIMESTAMP,
order_estimated_delivery_date TIMESTAMP)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse'
TBLPROPERTIES('skip.header.line.count'='1');


CREATE TABLE order_payments_dataset(
order_id STRING,
payment_sequential INT,
payment_type STRING, 
payment_installments INT,
payment_value FLOAT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/order_payement_dataset'
TBLPROPERTIES('skip.header.line.count'='1');
