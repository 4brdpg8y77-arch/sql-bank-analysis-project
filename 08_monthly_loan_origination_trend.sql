SELECT
SUM(loan_amount) AS total_loan_amount,
COUNT(loan_id) 	AS number_loans,
DATE_TRUNC('month', origination_date):: DATE AS month
FROM loans AS l
GROUP BY DATE_TRUNC('month', origination_date):: DATE
ORDER BY month ASC ;