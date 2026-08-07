SELECT 
SUM(loan_amount) AS total_loan,
COUNT(loan_id) AS number_loan,
loan_type
FROM loans
GROUP BY loan_type
ORDER BY total_loan DESC;