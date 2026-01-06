# SQL – Business Analysis Queries

This folder contains SQL scripts used to answer **core business questions**
as part of the end-to-end analytics workflow.

---

## SQL Environment Setup

The queries use standard SQL syntax and can be executed in most relational databases.

You may use any of the following:
- MySQL: https://dev.mysql.com/downloads/mysql/
- PostgreSQL: https://www.postgresql.org/download/
- SQLite: https://www.sqlite.org/download.html

Execution order:
1. Run `create_tables.sql`
2. Execute queries from `business_queries.sql`

---

## Business Questions & SQL Queries

---

### 1. Which branches contribute the most to total transaction value?

**Why this matters:**  
Helps management identify high-performing branches and compare performance across locations.

```SQL
SELECT
    b.branch_name,
    SUM(t.amount) AS total_transaction_value
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN branches b ON c.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_transaction_value DESC;

