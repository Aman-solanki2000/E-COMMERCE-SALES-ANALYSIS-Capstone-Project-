# 🛒 E-Commerce Sales Analysis — Data Analytics Capstone Project

An end-to-end data analytics and data science capstone project designed to systematically identify key factors affecting e-commerce revenue, analyze customer purchasing behavior, and drive long-term business retention using advanced statistical modeling and machine learning techniques.

---

## 📌 Business Problem & Objectives
Modern e-commerce businesses face massive challenges in predicting transaction sizes and curbing user churn. The objective of this project is to analyze geographical, product, and operational patterns to:
* **Analyze Behavior:** Examine purchasing nuances across different demographics, timeline milestones, and locations.
* **Identify Patterns:** Validate foundational business assumptions using rigorous statistical hypothesis testing.
* **Translate to Action:** Build machine learning pipelines to extract sales drivers and create data-driven cross-selling and retention strategies.

---

## 🛠️ Data & Analytical Approach
The project architecture is built upon a solid data foundation comprising transactional logs, product catalogs, regional parameters, user review scores, and payment preferences.

1. **Exploratory Data Analysis (EDA):** Uncovering key baseline performance trends across regions and sales categories.
2. **Statistical Analysis:** Applying inferential hypothesis testing (Independent Two-Sample T-Tests) to validate behavioral variance.
3. **Machine Learning Pipelines:** 
   * **Unsupervised Learning:** K-Means Clustering for behavioral customer segmentation.
   * **Supervised Learning:** Multiple Linear Regression (MLR) for granular sales driver identification.

---

## 📈 Key Findings & Data Insights

### 🏢 1. Revenue Concentration & Regional Performance
* **Top Product Categories:** **Furniture & Decor** leads the revenue stream at approximately **₹89M (8.9 Cr)**, followed closely by **Bed, Bath & Table** at **₹88M (8.8 Cr)** and **Sports & Leisure** at **₹85M**.
* **Geographical Strongholds:** Sales are heavily concentrated in the **South Region (₹263.5M / 26.35 Cr)** and **North Region (₹260.6M / 26.06 Cr)**.
* **Payment Systems:** **UPI** is the absolute dominant digital payment infrastructure, driving **₹528.5M (52.85 Cr)** of total revenue.

### 🧪 2. Statistical Modeling (Hypothesis Testing)
* **The Question:** *Do New and Returning customers spend differently?*
* **The Result:** Enforced an Independent Two-Sample T-Test which returned a **P-Value of 0.02588** (with a T-Statistic of 2.2280). 
* **Business Decision:** Since the P-Value < 0.05, we **Reject the Null Hypothesis ($H_0$)**. New customers ($\mu = ₹6,425.12$) exhibit statistically higher average purchase amounts than returning users ($\mu = ₹6,309.74$), proving the vital need for separated marketing flows.

### 🤖 3. Customer Segmentation (K-Means Clustering)
Segmented **41,419 unique customers** into 5 distinct behavioral clusters. Key highlighted personas include:
* **Persona 1 (High-Ticket Whales):** Accounts for **2.9%** of the user base. Characterized by exceptionally high Average Order Value (AOV). Requires premium VIP concierge programs.
* **Persona 2 (At-Risk Detractors):** Represents a dangerous **16.1%** of the customer base. Characterized by abysmal review scores ($\mu = 1.91$). Triggers immediate product quality checks and service recovery workflows to avoid imminent churn.

### 📉 4. Sales Driver Analysis (Multiple Linear Regression)
* **Model Accuracy:** The MLR pipeline achieved an exceptional **Test $R^2$ of 94.76%** (Train: 94.38% | Val: 94.00%), confirming that the selected variables capture almost all variance in transaction sizes without overfitting.
* **Model Errors:** Evaluated a stable Test **RMSE of ₹2,108.05** and Test **MAE of ₹1,072.03**.
* **The Drivers:** 
   * **Basket Size (Quantity):** Marked as the strongest positive driver with a massive coefficient of **+3,123.84**.
   * **Discount %:** Exhibited a negative relationship (**-65.78**), mathematically proving that broad blanket discounting harms overall sales efficiency.

---



## 🖥️ Final Dashboard View
An interactive tool engineered for real-time monitoring of regional performance, customer segments, category revenue, and operational KPIs.

![E-Commerce Sales Analysis Dashboard](images/dashboard.png)



---

## 🛠️ Data-Driven Strategic Recommendations
* **Cross-Selling over Discounting:** Replace wide profit-eroding discount schemes with data-backed cross-selling strategies and automated product bundles to maximize basket quantities.
* **Checkout UX Optimizations:** Given that **UPI** dominates digital checkout volume, maintaining zero latency on UPI checkouts is highly mission-critical to eliminate payment friction.
* **Targeted Allocations:** Maintain inventory buffer safety stocks for Furniture and Bed/Bath lines exclusively within South and North fulfillment distribution centers.

---

## ⚠️ Challenges, Limitations & Future Scope
* **Data-Level Bottlenecks:** Addressed missing temporal stamps across shipping/delivery schedules and customized treatments for volatile price/quantity outliers.
* **Analytical Limitations:** Model associations imply directional dependency but do not definitively prove absolute correlation causation without external data (e.g., market competitor pricing matrices).
* **Future Scope:** Deploying the fully built interactive **Streamlit Dashboard** into a cloud server environment for real-time live business metric updates.

---
*Capstone Project developed by **Aman Solanki** — Recreated using Gemini Notebook Data Craft.*
