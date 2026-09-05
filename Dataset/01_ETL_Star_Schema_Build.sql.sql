
-- B2B SALES DATA PIPELINE (ETL) - STAR SCHEMA GENERATION


-- 1. CUSTOMER DIMENSION
CREATE TABLE Dim_Customer AS
SELECT DISTINCT 
    "Customer.ID" AS customer_id, 
    "Customer.Name" AS customer_name, 
    "Segment" AS segment
FROM superstore
WHERE "Segment" IN ('Corporate', 'Home Office');


-- 2. PRODUCT DIMENSION
CREATE TABLE Dim_Product AS
SELECT DISTINCT 
    "Product.ID" AS product_id, 
    "Category" AS category, 
    "Sub.Category" AS sub_category, 
    "Product.Name" AS product_name
FROM superstore;


-- 3. LOCATION DIMENSION
CREATE TABLE Dim_Location AS
SELECT DISTINCT 
    ("City" || '-' || "State" || '-' || "Country") AS location_key,
    "City" AS city, 
    "State" AS state, 
    "Country" AS country, 
    "Region" AS region, 
    "Market" AS market
FROM superstore;


-- 4. SALES FACT TABLE
CREATE TABLE Fact_Sales AS
SELECT 
    "Order.ID" AS order_id,
    "Order.Date" AS order_date,
    "Ship.Date" AS ship_date,
    "Customer.ID" AS customer_id,
    "Product.ID" AS product_id,
    ("City" || '-' || "State" || '-' || "Country") AS location_key,
    "Sales" AS sales,
    "Quantity" AS quantity,
    "Discount" AS discount,
    "Profit" AS profit
FROM superstore
WHERE "Segment" IN ('Corporate', 'Home Office');