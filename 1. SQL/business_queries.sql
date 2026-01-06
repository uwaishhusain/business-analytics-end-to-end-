-- Which branches contribute the most to total transaction value?

SELECT b.branch_name, SUM(t.amount) AS total_transaction_value
FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id
JOIN branches b
ON c.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_transaction_value DESC;

-- How does transaction value trend over time?

SELECT DATE_FORMAT(t.transaction_date, '%Y-%m') AS transaction_month, SUM(t.amount) AS monthly_transaction_value
FROM transactions t
GROUP BY transaction_month
ORDER BY transaction_month;

-- Contribution of Retail vs SME customers

SELECT c.customer_type, SUM(t.amount) AS total_value
FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id
GROUP BY c.customer_type;

-- Average transaction size by branch

SELECT b.branch_name, AVG(t.amount) AS avg_transaction_value
FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id
JOIN branches b
ON c.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY avg_transaction_value DESC;

-- Overall KPIs for management dashboard

SELECT SUM(amount) AS total_transaction_value, AVG(amount) AS avg_transaction_value, COUNT(*) AS total_transactions
FROM transactions;

-- Percentage contribution of each branch

SELECT b.branch_name, 
		ROUND(SUM(t.amount) / (SELECT SUM(amount) FROM transactions) * 100, 2) AS contribution_percentage
FROM transactions t
JOIN customers c
ON t.customer_id = c.customer_id
JOIN branches b
ON c.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY contribution_percentage DESC;

