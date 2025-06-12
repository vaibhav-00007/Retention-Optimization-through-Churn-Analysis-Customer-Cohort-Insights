# Retention Optimization through Churn Analysis & Customer Cohort Insights


## Overview

- A comprehensive SQL-based analysis on 3.4 M+ grocery orders from 200K+ users to identify customer behavior patterns, segment cohorts, and detect churn.
- Segmented users into 4 behavioral cohorts (Frequent & Diverse, Frequent Only, Diverse Only, Occasional/Narrow), revealing that ~76% of users fall into extreme ends of the engagement spectrum.
- Identified that 88.6% of users were churned, 8.9% at-risk, while only 2.5% remained active, prompting strategic recommendations for personalized marketing, reorder reminders, and VIP loyalty programs.


## Business Objective

To empower marketing and product teams with a **data-driven strategy** to:
- Detect **churned** and **at-risk** customers
- Segment users into **cohorts** based on purchase behavior
- Recommend **retention** tactics using frequency and diversity patterns

  
## Dataset Overview

The project is based on the Instacart Market Basket Analysis dataset, consisting of:

| Table | Description |
|-------|-------------|
| `orders` | Order metadata with user, time, and sequence |
| `order_products__prior` | Product-level data from previous orders |
| `products`, `aisles`, `departments` | Product catalog and hierarchy data |


## Data Cleanup & Quality Checks

📄 Script: [0_data_cleaning_checks.sql](https://github.com/vaibhav-00007/Retention-Optimization-through-Churn-Analysis-Customer-Cohort-Insights/blob/main/0_data_cleaning_checks.sql)

- Removed leading/trailing white spaces from text fields
- Verified uniqueness and non-null constraints on primary keys
- Identified and flagged duplicate records in key dimension and fact tables
- Prepared clean, analysis-ready data to be used in views, segmentation, and churn modeling

  
## 🔍 Key Analysis

### 1. Customer Segmentation

- Segmented 200K+ users using `frequency` (number of orders) and `product diversity` (unique products)
- Created **four distinct segments**:
  - `Frequent & Diverse` (37.9%)
  - `Frequent Only`
  - `Diverse Only`
  - `Occasional / Narrow` (37.9%)

### 2. Churn Detection
- Calculated days since last order to identify:
  - `Active` (0–30 days)
  - `At-Risk` (31–60 days)
  - `Churned` (60+ days)
- Found that **88.6% of users were churned**, with only **2.5% active**

---

## 📊 Business Insights

- 🛍 **59% reorder rate** suggests potential for subscription models
- 📉 **High churn (88.6%)** highlights the need for personalized re-engagement
- 🧠 **Segmented marketing** can drive higher conversions by targeting:
  - Occasional users with cross-sell promotions
  - Frequent buyers with loyalty rewards
  - At-risk customers with time-sensitive offers

---

## 💡 Recommendations

| Segment | Actionable Strategy |
|---------|---------------------|
| Frequent & Diverse | Launch VIP subscriptions, reward tiers |
| Occasional / Narrow | Reactivation campaigns, cross-sell push |
| Frequent Only | Encourage variety with new-category coupons |
| Churned | LTV-based re-engagement, feedback surveys |

---

## 📈 Results Summary

- 🧾 Processed 3M+ rows of transaction data
- 👥 Analyzed 206K+ users and 49K+ products
- 🧠 Generated cohort insights that enable targeted retention strategies
- 🎯 Converted raw data into business impact recommendations

  
---

## 🛠️ Tools & Tech Stack

- **SQL Server Management Studio (SSMS)** – data analysis & transformation
- **Tableau** – data visualization
- **Notion** – documentation
- **GitHub** – version control & publishing
