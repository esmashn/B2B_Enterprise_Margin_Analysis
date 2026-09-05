# B2B Sales & Profit Margin Analytics

## Overview
This project focuses on identifying profit leakage, analyzing the financial impact of discount strategies, and optimizing customer segmentation for a B2B enterprise. By extracting flat-file data and transforming it into a robust Star Schema, this analytical pipeline provides C-level executives with actionable insights into margin degradation.

## Tech Stack
* **Data Transformation & ETL:** PostgreSQL / SQL 
* **Business Intelligence & Visualization:** Power BI
* **Data Modeling:** Star Schema Design, DAX (Data Analysis Expressions), Power Query

## Data Architecture & ETL Pipeline
* **Star Schema:** Transformed raw transactional flat-files into a strict Star Schema consisting of 1 Fact table (`fact_sales`) and 5 Dimension tables (`dim_customer`, `dim_product`, `dim_location`, `dim_date`, `dim_customer_tier`).
* **Data Quality:** Resolved severe many-to-many (`*:*`) relationship duplications and cross-filter directional bugs to ensure row-level financial accuracy. Corrected decimal-shift data anomalies caused by international locale mismatches during the initial ETL phase.

## Dashboard Showcase

### 1. Executive Overview
Provides a high-level summary of corporate performance, tracking revenue vs. profit trends and overall profit margin stability.
![Executive Overview](Page_1.png)

### 2. Product & Margin Analysis
Evaluates sub-category performance and correlates applied discounts against total profit to identify unprofitable product lines.
![Product and Margin Analysis](Page_2.png)

### 3. Customer Segmentation
Breaks down customer tiers (Platinum, Gold, Silver, Red) to analyze which segments drive true profitability versus which drain margins due to over-discounting.
![Customer Segmentation](Page_3.png)

### 4. Geographic Leakage
Isolates specific regions and countries causing severe financial loss, utilizing heat maps and waterfall charts to pinpoint profit drainers.
![Geographic Leakage](Page_4.png)

## Key Business Insights
* **Corporate Baseline:** The enterprise operates at an **11.7% net profit margin**, generating $718K in total profit from $6.1M in revenue.
* **Discount-Driven Leakage:** The "Red (Loss Making)" customer segment receives the highest average discount (over 13%), completely eroding profitability and acting as the primary catalyst for margin drops.
* **Geographic Profit Drain:** Isolated severe regional profit leakage, successfully identifying specific markets (e.g., Turkey) responsible for **$443K in total financial loss**.

## Repository Structure
```text
├── datasets/
│   ├── 01_ETL_Star_Schema_Build.sql
│   ├── 02_Customer_Segmentation_Tier.sql
│   ├── dim_customer.csv
│   ├── dim_product.csv
│   ├── dim_location.csv
│   ├── dim_date.csv
│   ├── dim_customer_tier.csv
│   ├── fact_sales.csv
│   └── raw_superstore_data.csv
├── B2B_Enterprise_Margin_Analysis.pbix
└── README.md
