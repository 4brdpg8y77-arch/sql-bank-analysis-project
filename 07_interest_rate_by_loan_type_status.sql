SELECT 
loan_status,
loan_type,
ROUND(AVG(interest_rate),2)AS avg_interest_rate
FROM loans AS l
GROUP BY loan_status,loan_type
ORDER BY avg_interest_rate DESC;
