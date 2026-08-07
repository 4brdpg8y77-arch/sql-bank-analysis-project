SELECT
c.customer_id,
SUM(l.loan_amount) AS total_loan_amount,
c.annual_income
FROM customers AS c
INNER JOIN loans AS l
ON c.customer_id = l.customer_id
GROUP BY c.customer_id , c.annual_income
HAVING SUM(l.loan_amount) > c.annual_income
ORDER BY total_loan_amount DESC;