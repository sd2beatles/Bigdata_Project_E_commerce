
import org.apache.spark.sql.types.{IntegerType, StringType, StructType,TimestampType,FloatType}

val path="/data/archive/"
val names=List("olist_customers_dataset.csv","olist_orders_dataset.csv","olist_order_payments_dataset.csv")
val schema_cs=new StructType()
.add("customer_id",StringType,nullable=false)
.add("customer_unique_id",StringType,nullable=false)
.add("customer_zip_code",IntegerType,nullable=true)
.add("customer_city",StringType,nullable=true)
.add("customer_state",StringType,nullable=true)

val customer_data=spark.read.schema(schema_cs).option("sep",",").option("header","true").csv(path+names(0))


val schema_od=new StructType()
.add("oder_id",StringType,nullable=false)
.add("customer_id",StringType,nullable=false)
.add("order_status",StringType,nullable=false)
.add("order_purchase_time",TimestampType,nullable=false)
.add("order_approved_at",TimestampType)
.add("order_delivered_arrier_at",TimestampType)
.add("order_delivered_customer_date",TimestampType)
.add("order_estimated_delivery_date",TimestampType)

val order_data=spark.read.schema(schema_od).option("sep",",").option("header","true").csv(path+names(1))


val schema_pd=new StructType()
.add("order_id",StringType,nullable=false)
.add("payment_sequential",IntegerType)
.add("payment_type",StringType)
.add("payment_installments",IntegerType)
.add("payment_value",FloatType)

val product_data=spark.read.schema(schema_pd).option("sep",",").option("header","true").csv(path+names(2))



customer_data.createOrReplaceTempView("customer_data")
order_data.createOrReplaceTempView("order_data")
product_data.createOrReplaceTempView("product_data")
