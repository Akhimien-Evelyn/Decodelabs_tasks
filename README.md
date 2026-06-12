# Decodelabs_tasks
E-Commerce data analytics projects completed during my Data Analytics Internship at Decode Labs. Covers Week 1-4 assignments: Data Cleaning and Preparation, Exploratory Data Analysis (EDA), SQL Data Analysis and Data Visualization using Excel.

# PROJECT 1: DATA CLEANING AND PREPARATION
# Project Overview
This project focuses on cleaning and preparing a raw e-commerce dataset to make it ready for analysis. Raw data in the real world is messy, it contains missing values, duplicate records, and incorrect formats. This project demonstrates how to identify and fix those issues systematically.
Dataset: E-Commerce Orders Dataset
Records: 1,200 orders
Period: January 2023 – June 2025
Tool Used: Excel 
# Goal
Clean a raw dataset by handling missing values, duplicates, and incorrect data, transforming it from raw, unreliable data into a clean, analysis-ready table.
# Key Requirements And How I Met Them
 1. Identify Missing or Null Values
The dataset had 309 missing values in the CouponCode column — representing 25.75% of all records.
Finding:

| Column | Missing Count | Action Taken |
|----------|------------|----------|
| CouponCode | 309 | Filled with "No Coupon" |
| All other columns | 0 | No action needed |

Result: 
1. CouponCode column went from 75.25% complete → 100% complete with 4 clean categories:
FREESHIP — 313 orders
No Coupon — 309 orders
WINTER15 — 292 orders
SAVE10 — 286 orders

2. Remove Duplicates
Checked all 1,200 records for duplicate OrderID entries.
Finding: All 1,200 OrderIDs were unique — no duplicate records found.

3. Correct Data Formats

Dates:
- Verified date column contained valid dates within the expected range (Jan 2023 – Jun 2025)
- No future dates or null dates found
- Format confirmed as YYYY-MM-DD

Numbers:
- UnitPrice: Range verified ($11.39 – $699.93) — no negatives or zeros
- TotalPrice: Range verified ($11.39 – $3,456.40) — no negatives or zeros
- Quantity: Confirmed integer values between 1 and 5 only

Text Columns:
- Trimmed leading/trailing spaces from Product, OrderStatus, PaymentMethod, ReferralSource
- Verified consistent casing and spelling across all categorical columns

# PROJECT 2: EXPLORATORY DATA ANALYSIS (EDA)
# Project Overview
Exploratory Data Analysis (EDA) is the process of investigating a dataset to discover patterns, spot anomalies, test assumptions, and summarize main characteristics before any modelling or reporting begins. This project applies EDA techniques to a real e-commerce dataset.
Tool Used: Excel 
# Goal
Analyze a dataset to understand its patterns, trends, and distributions using descriptive statistics, outlier detection, and trend identification.
# Key Requirements And How I Met Them
1. Calculate Basic Statistics

| Metric | Quantity | Unit Price ($) | Items in Cart | Total Price ($) |
| ------------| ------ | ----------- | --------- | --------- |
| Count | 1,200 | 1,200 | 1,200 | 1,200 |
| Mean | 2.95 | 356.41 | 5.49 | 1,053.97 |
| Median | 3.00 | 364.21 | 5.00| 823.62 |
| Std Dev | 1.41 | 197.18 | 2.28 | 819.86 |
| Min | 1 | 11.39 | 1 | 11.39 |
| Q1 (25th %) | 2 | 186.06 | 4 | 410.52 |
| Q3 (75th %) | 4 | 521.57 | 7 | 1,578.48 |
| Max | 5 | 699.93 | 10 | 3,456.40 |

# Key observation
1. Mean Total Price ($1,054) is significantly higher than the Median ($824). This $230 gap indicates right-skewed data; a small number of very large orders are pulling the average upward. The median is the more reliable measure of a "typical" order.
2. Trends and Outliers
Revenue Trends

Monthly Revenue Pattern (2023–2025):

| Year | Total Revenue | YoY Change |
|--------|-----------|------------|
| 2023 | ~$552,000 | Baseline |
| 2024 | ~$480,000 | ▼ −13% |
| 2025 (Jan–Jun) | ~$231,000 | Partial year |

Peak months identified:

May 2023: $63,837 (highest in 2023)

June 2024: $68,069 (highest overall — anomaly worth investigating)

Revenue by Product:

| Product | Total Revenue | Avg Order Value |
| ------- | -------- | ------- | 
| Chair | $195,620 | $1,099.55 |
| Printer | $195,613 | $1,080.88 |
| Laptop | $192,127 | $1,110.56 |
| Tablet | $186,569 | $1,042.28 |
| Monitor | $175,651 | $1,077.61 |
| Desk | $167,460 | $984.47 |
| Phone | $151,722 | $972.57 |

Revenue by Referral Source:
| Source | Total Revenue | Orders |
| ------- | --------- | --------- |
| Instagram | $275,285 | 259 |
| Email | $261,809 | 255 |
| Google | $250,441 | 246 |
| Facebook | $250,411 | 228 |
| Referral | $226,816 | 212|

Outlier Detection — IQR Method

Result: 8 outlier orders detected
| Order ID | Product | Total Price | Status |
| --------- | -------- | ---------- | -------- |
| ORD200107 | Printer | $3,353.75 | 🔴 Outlier |
| ORD200326 | Laptop | $3,352.40 | 🔴 Outlier |
| ORD200328 | Tablet | $3,370.20 | 🔴 Outlier |
| ORD200469 | Chair | $3,384.90 | 🔴 Outlier | 
| ORD200632 | Laptop | $3,390.80 | 🔴 Outlier |
| ORD200789 | Tablet | $3,456.40 | 🔴 Outlier |
| ORD201065 | Printer | $3,334.00 | 🔴 Outlier |
| ORD201122 | Monitor | $3,390.95 | 🔴 Outlier |

All 8 are maximum-quantity (5 units) orders at high unit prices. These are legitimate bulk purchases, not data errors but worth tracking separately as potential B2B or VIP customers.

3. Critical Finding
41.4% Order Failure Rate
250 orders Cancelled + 247 orders Returned = 497 total failed orders
This represents 41.4% of all orders far above industry norms (typically 5–15%)
Recommended action: Investigate which product, channel, or time period has the highest failure rate

Payment Method Performance
| Payment Method | Order Count | Avg Order Value |
| --------- | ----------- | ----------- |
| Credit Card | 234 | $1,127.55 |
| Gift Card | 230 | $1,070.91 | 
| Cash | 246 | $1,055.78 |
| Online | 258 |$1,017.49 |
| Debit Card | 232 | $1,001.87 |

Coupon Impact on Spending
| Group | Orders | Avg Order Value |
| --------- | ----------- | ---------- |
| Has Coupon | 891 | $1,057.64 |
| No Coupon | 309 | $1,043.37 |

Coupons attract volume (74.3% usage) but have minimal impact on how much customers spend per order.

# Insight
1. 41.4% cancellation + return rate (revenue loss)
2. Revenue declining 13% YoY (2023→2024) (Trend alert)
3. Instagram drives highest revenue ($275K) (Opportunity)
4. Credit card users spend 12.6% more (Opportunity)
5. Coupons barely lift AOV (+1.4%) (Review coupon strategy)
6. outlier orders — all legitimate bulk buys (VIP customer opportunity)
7. Phones have lowest revenue of all products (Review product strategy)

# PROJECT 3: SQL DATA ANALYSIS
# Project Overview
This project uses SQL queries to extract meaningful insights. SQL (Structured Query Language) is the industry-standard tool for querying, filtering, grouping, and aggregating data stored in databases. This project demonstrates core SQL skills applied to real business questions.

Tool Used: SQL
# Goal
Use SQL queries to extract insights from a dataset; writing SELECT queries, using WHERE, ORDER BY, and GROUP BY, and performing basic aggregations (COUNT, SUM, AVG).

# Key Requirements And Queries

# 1. SELECT Queries

- View all orders:

_SELECT * FROM [Decode_ECommerce_Orders]_

- View specific columns:

_SELECT OrderID, Product,Total_Price, Order_Status FROM [Decode_ECommerce_Orders]_

 - View Top highest value orders:

_SELECT TOP 10 OrderID, Product, Quantity, Total_Price FROM [Decode_ECommerce_Orders]_

# 2. WHERE — Filtering Data

- Orders that were delivered;

_SELECT * FROM [Decode_ECommerce_Orders] WHERE Order_Status = 'Delivered'_

- Orders above $3,000:

_SELECT * FROM [Decode_ECommerce_Orders] WHERE Total_Price > 3000_

- Cancelled OR returned orders:

_SELECT * FROM [Decode_ECommerce_Orders] WHERE Order_Status = 'Cancelled' OR Order_Status = 'Returned'_

- Outlier Orders (Above upper fence)

_SELECT * FROM [Decode_ECommerce_Orders] WHERE Total_Price > 3330.41_

- Instagram orders paid by Credit card;

_SELECT * FROM [Decode_ECommerce_Orders] WHERE Referral_Source = 'Instagram' AND Payment_Method = 'Credit Card'_

- Orders with No Coupon used

_SELECT * FROM [Decode_ECommerce_Orders] WHERE Coupon_Code = 'NO COUPON'_

# 3. GROUP BY — Aggregating by Category

- Total Revenue, Orders, Avg Order Value by Product

_SELECT Product, 
    COUNT(*) AS TotalOrders,
   SUM(Total_Price) AS TotalRevenue,
   AVG(Total_Price) AS AvgOrderValue
  FROM [Decode_ECommerce_Orders]
GROUP BY Product;_

- Order count by Order status

 _SELECT Order_Status,
       COUNT(*) AS OrderCount
      FROM [Decode_ECommerce_Orders]
     GROUP BY Order_Status_

   - Revenue by Referral source

_SELECT Referral_Source,
          COUNT(*) AS Orders,
         SUM(Total_Price) AS TotalRevenue,
        AVG(Total_Price) AS AvgOrderValue
FROM [Decode_ECommerce_Orders]
GROUP BY Referral_Source_

- Revenue by Payment method

_SELECT Payment_Method,
             COUNT(*) AS Orders,
            SUM(Total_Price) AS TotalRevenue,
           AVG(Total_Price) AS AOV
FROM [Decode_ECommerce_Orders]
GROUP BY Payment_Method_

# 4. Overall Basic Statistics

_SELECT
      COUNT(*) AS TotalOrders,
      SUM(Total_Price) AS TotalRevenue,
      AVG(Total_Price) AS AvgOrderValue,
      MIN(Total_Price) AS SmallestOrder,
      MAX(TOTAL_Price) AS LargestOrder
FROM [Decode_ECommerce_Orders]_


# PROJECT 4: DATA VISUALIZATION 
# Project Overview
Data visualization transforms numbers into stories. This project creates multiple chart types to communicate insights from an e-commerce dataset clearly and effectively, demonstrating how the right visual can reveal patterns that raw tables and numbers alone cannot show.

Tools Used: Excel Charts 

# Goal
Create visual representations of data to communicate insights clearly, selecting appropriate chart types for each question, and using visuals to tell a coherent data story.

# Key Requirements And How I Met Them

# 1. Charts Created

# Line Chart — Monthly Revenue Trend
Question answered: 
- How has revenue changed over time?
- Why a line chart: Line charts are ideal for showing continuous change over time.

Key finding:
- Revenue peaked in June 2024 at $68,069
- Overall trend is declining year-on-year (2024 was 13% below 2023)
- Notable dip in April 2023 ($27,752) and May 2024 ($27,909)

# Bar Chart — Revenue by Product
Question answered: 
- Which products generate the most revenue?
- Why a bar chart: Bar charts make category comparisons easy and clear.

# Column Chart — Revenue by Referral Source
Question answered: Which marketing channel drives the most revenue?
Why Column: Long category names are easier to read on a vertical axis.





