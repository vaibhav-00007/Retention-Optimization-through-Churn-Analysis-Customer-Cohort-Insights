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

  
## Key Analysis

### 1. Customer Segmentation


- Segmented customers based on `frequency` (number of orders) and `product diversity` (unique products)
- Created **four distinct segments**:
  - `Frequent & Diverse` 
  - `Frequent Only`
  - `Diverse Only`
  - `Occasional / Narrow`
    
📈  **Visualization**
  
 ![Customer Segmentation by Frequency & Basket Diversity](https://github.com/vaibhav-00007/Retention-Optimization-through-Churn-Analysis-Customer-Cohort-Insights/raw/main/Images/3_customer_segmentation_by_frequency_%20basket_diversity.png)

🔍 **What This Tells Us**
  - Occasional / Narrow (37.9%): infrequent shoppers with narrow baskets.
  - Frequent & Diverse (37.9%): power users with broad product exploration.
  - Frequent Only (12.1%): frequent orders but limited variety.
  - Diverse Only (12.1%): wide variety but low ordering frequency.

💡 **Recommendations**
  - Frequent & Diverse: Launch VIP subscription & promote premium bundles to leverage broad interests.
  - Occasional / Narrow: Deploy reactivation emails & use cross-sell suggestions to expand basket diversity.
  - Frequent Only: Embed in-cart recommendations for complementary products & offer "X% off a new category" coupons to encourage variety.
  - Diverse Only: - Trigger reorder reminders based on typical interval patterns & promote automated subscription options for favorite items.
    
### 2. Churn Detection
- Calculated days since last order to identify:
  - `Active` (0–30 days)
  - `At-Risk` (31–60 days)
  - `Churned` (60+ days)
- Found that **88.6% of users were churned**, with only **2.5% active**
- Summary Results

| Bucket             | Users   | % of Total | Avg Days Since Last Order |
|--------------------|---------|------------|----------------------------|
| Active (0–30d)     | 5,154   | 2.50%      | 21.6 days                  |
| At-Risk (31–60d)   | 18,383  | 8.91%      | 47.2 days                  |
| Churned (>60d)     | 182,672 | 88.59%     | 190.2 days                 |

  
📈  **Visualization**

  ![Churned Customers - Last 30 Days](https://github.com/vaibhav-00007/Retention-Optimization-through-Churn-Analysis-Customer-Cohort-Insights/raw/main/Images/4_customers_who%E2%80%99ve_churned_in_the_last_30_days.png)

  

🔍 **What This Tells Us**
  - Very Low Active Base (2.5%): Only 5,154 users placed an order in the past 30 days.
  - Small At-Risk Pool (8.9%): 18,383 users are between 31–60 days since last order.
  - Large Churned Majority (88.6%): 182,672 users have been silent for over 60 days—Their average inactivity is ~190 days, indicating long-term disengagement.

💡 **Recommendations**
  - Protect the Active Cohort: Present complementary items immediately after purchase.
  - Win Back the At-Risk Group:  Drive urgency with "30% off your next order within 7 days" promotions.
  - Re-Evaluate the Churned Mass: Focus first on high-LTV lapsed users by segmenting this group by lifetime value and past purchase frequency.
    

## Business Insights & Summary

- 🛍 **59% reorder rate** suggests potential for subscription models
- 📉 **High churn (88.6%)** highlights the need for personalized re-engagement
- 🧠 **Segmented marketing** can drive higher conversions by targeting:
  - Occasional users with cross-sell promotions
  - Frequent buyers with loyalty rewards
  - At-risk customers with time-sensitive offers
    
- Recommendations Summary

| Segment | Actionable Strategy |
|---------|---------------------|
| Frequent & Diverse | Launch VIP subscriptions, reward tiers |
| Occasional / Narrow | Reactivation campaigns, cross-sell push |
| Frequent Only | Encourage variety with new-category coupons |
| Churned | LTV-based re-engagement, feedback surveys |

### 📈 Results Summary

- 🧾 Processed 3M+ rows of transaction data
- 👥 Analyzed 206K+ users and 49K+ products
- 🧠 Generated cohort insights that enable targeted retention strategies
- 🎯 Converted raw data into business impact recommendations


## 🛠️ Tools & Tech Stack

- **SQL Server Management Studio (SSMS)** – data analysis & transformation
- **Tableau** – data visualization
- **Notion** – documentation
- **GitHub** – version control & publishing
