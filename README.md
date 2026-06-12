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

# Key observation — Mean vs Median gap:
1. Mean Total Price ($1,054) is significantly higher than the Median ($824). This $230 gap indicates right-skewed data; a small number of very large orders are pulling the average upward. The median is the more reliable measure of a "typical" order.
2. 



