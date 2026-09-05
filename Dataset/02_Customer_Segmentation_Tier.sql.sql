
-- 5. CUSTOMER SEGMENTATION TIER (AGGREGATION TABLE)
CREATE TABLE Dim_Customer_Tier AS
SELECT 
    customer_id,
    SUM(sales) AS lifetime_sales,
    SUM(profit) AS lifetime_profit,
    CASE 
        WHEN SUM(profit) >= 3000 THEN 'Platinum (High Value)'
        WHEN SUM(profit) >= 1000 THEN 'Gold (Profitable)'
        WHEN SUM(profit) >= 0 THEN 'Silver (Low Margin)'
        ELSE 'Red (Loss Making)'
    END AS customer_tier
FROM Fact_Sales
GROUP BY customer_id;


-- 6. DATE DIMENSION (CALENDAR TABLE)
CREATE TABLE Dim_Date AS
SELECT 
    datum AS date_key,
    EXTRACT(YEAR FROM datum) AS year,
    EXTRACT(MONTH FROM datum) AS month_number,
    TRIM(TO_CHAR(datum, 'Month')) AS month_name,
    EXTRACT(QUARTER FROM datum) AS quarter,
    CASE WHEN EXTRACT(ISODOW FROM datum) IN (6, 7) THEN 1 ELSE 0 END AS is_weekend
FROM (
    SELECT CAST(GENERATE_SERIES(
        '2010-01-01'::date, 
        '2025-12-31'::date, 
        '1 day'::interval
    ) AS date) AS datum
) AS date_series;