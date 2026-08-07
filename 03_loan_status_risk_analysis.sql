SELECT
COUNT(loan_id) AS number_loans,
ROUND(AVG(loan_amount),2) AS avg_loan_amount,
loan_status
FROM loans
GROUP BY loan_status
ORDER BY number_loans DESC;