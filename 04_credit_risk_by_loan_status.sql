SELECT
ROUND(AVG(c.credit_score),2) AS avg_credit_score,
ROUND(AVG(c.annual_income),2) AS avg_annual_income,
l.loan_status
FROM customers AS c
INNER JOIN loans AS l
ON c.customer_id = l.customer_id
GROUP BY l.loan_status
ORDER BY avg_credit_score ASC ;