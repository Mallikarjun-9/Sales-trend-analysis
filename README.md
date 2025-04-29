# Sales-trend-analysis
Analyze monthly revenue and order trends using PostgreSQL aggregations on the Olist E-Commerce dataset.
# E-Commerce Sales Trend Analysis (PostgreSQL)

This project performs a monthly sales trend analysis using SQL aggregations on the. It extracts order volume and revenue trends by month and year to uncover business insights using PostgreSQL.

---
**[Online Retail dataset](https://archive.ics.uci.edu/dataset/352/online%2Bretail)**

---

## 🔍 Task Overview

**TASK 6: Sales Trend Analysis Using Aggregations**  
- **Objective:** Analyze monthly revenue and order volume using SQL.
- **Tools Used:** PostgreSQL (pgAdmin 4)
- **Dataset Table:** `online_sales` (columns: `invoice_no`, `stock_code`, `description`, `quantity`, `invoice_date`, `unit_price`, `customer_id`, `country`)
- **Deliverables:** SQL script + Results Table

---

## 📊 Analysis Performed

The analysis focuses on:

- Extracting `YEAR` and `MONTH` from `invoice_date`
- Calculating:
  - **Total Revenue** = `unit_price * quantity`
  - **Order Volume** = `COUNT(DISTINCT invoice_no)`
- Grouping results by year and month
- Sorting the output chronologically

---

## 🧠 SQL Logic Used

```sql
SELECT 
  EXTRACT(YEAR FROM TO_TIMESTAMP(invoice_date, 'DD-MM-YYYY HH24:MI')) AS order_year,
  EXTRACT(MONTH FROM TO_TIMESTAMP(invoice_date, 'DD-MM-YYYY HH24:MI')) AS order_month,
  SUM(unit_price * quantity) AS total_revenue,
  COUNT(DISTINCT invoice_no) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


---

![output](https://github.com/Mallikarjun-9/Sales-trend-analysis/blob/2cf2329717030e22c5a63bafdbc463c193cdbc98/Screenshot%202025-04-29%20165406.png)
