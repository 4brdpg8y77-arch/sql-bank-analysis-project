SELECT
customer_segment,
ROUND(AVG(annual_income),2) AS avg_income,
ROUND(AVG(credit_score),2) AS avg_credit_score
FROM customers
GROUP BY customer_segment
ORDER BY  avg_income DESC;