# Banking Loan Portfolio Analysis (SQL + Excel + Power BI)

## Project Overview

This project demonstrates a simple data analysis workflow using **SQL, Microsoft Excel, and Power BI** to analyze a banking loan portfolio dataset.
The goal of this analysis is to calculate the **Outstanding Loan Distribution by Collectibility Category** for each reporting period and determine the percentage contribution of each category to the total outstanding loans.

This type of analysis is commonly used in banking and financial institutions to monitor **loan quality and risk exposure**.
---
## Tools Used
* SQL (DBeaver)
* Microsoft Excel
* Power BI
---
## Dataset
The dataset used in this project is a **dummy banking dataset** that simulates loan portfolio data.
Example fields in the dataset:

| Column           | Description                        |
| ---------------- | ---------------------------------- |
| Periode          | Reporting period of the loan data  |
| Kolektibilitas   | Loan collectibility category       |
| Sisa_Outstanding | Remaining outstanding loan balance |
---
## Analysis Objective

The objective of this analysis is to:

* Calculate the **total outstanding loan for each collectibility category**
* Calculate the **total outstanding loan for each period**
* Determine the **percentage contribution of each collectibility category to the total portfolio**

This helps visualize how loan quality changes across different reporting periods.

---
## SQL Query

```sql
SELECT 
    a.Periode,
    a.Kolektibilitas,
    SUM(a.Sisa_Outstanding) AS total_os_by_kol,
    b.total_os_all,
    SUM(a.Sisa_Outstanding) * 1.0 / b.total_os_all AS persentase
FROM banking_dataset a
JOIN (
    SELECT 
        Periode,
        SUM(Sisa_Outstanding) AS total_os_all
    FROM banking_dataset
    GROUP BY Periode
) b ON a.Periode = b.Periode
GROUP BY a.Periode, a.Kolektibilitas, b.total_os_all
ORDER BY a.Periode, a.Kolektibilitas;
```

---

## Query Explanation

This query performs several key steps:

1. **Calculate total outstanding loan per collectibility category**

   * Using `SUM(Sisa_Outstanding)` grouped by `Periode` and `Kolektibilitas`.

2. **Calculate total outstanding loan per period**

   * Using a subquery to aggregate all loan balances per reporting period.

3. **Join the results**

   * The query joins the category totals with the overall totals per period.

4. **Calculate percentage contribution**

   * Each collectibility category is divided by the total outstanding amount for the same period.

This allows us to measure the **proportion of each loan quality category in the portfolio**.

---

## Data Processing Workflow

The data analysis process follows these steps:

1. Extract and analyze data using **SQL (DBeaver)**
2. Perform additional data checks or summaries in **Microsoft Excel**
3. Build interactive dashboards and visualizations in **Power BI**

---

## Dashboard Visualization

The final results are visualized using **Power BI dashboards**, allowing users to:

* Monitor loan portfolio composition
* Analyze loan collectibility trends
* Identify potential credit risk indicators

Example dashboard components:

* Outstanding Loan by Collectibility
* Portfolio Distribution by Period
* Percentage Composition of Loan Categories
---

## Key Learning Outcomes

Through this project, I practiced:

* Writing SQL queries for data aggregation
* Performing portfolio analysis using financial data
* Creating data visualizations in Power BI
* Building an end-to-end data analysis workflow

---

## Author

**Aslam Dafa Fauzan**

Data Analyst | IT Auditor | Web Developer

GitHub: https://github.com/aslamdafa
LinkedIn: https://linkedin.com/in/aslam-dafa-fauzan
