DROP TABLE IF EXISTS olist_customers_dataset;

CREATE TABLE  olist_customers_dataset (
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
LOCATION '/data/input'
TBLPROPERTIES("skip.header.line.count"="1");
