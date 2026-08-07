SELECT 
SUM(l.loan_amount) AS total_outstanding_loan_amount,
c.customer_segment
FROM customers AS c
INNER JOIN loans AS l
ON c.customer_id = l.customer_id
WHERE l.loan_status IN ('Late','Default')
GROUP BY c.customer_segment
ORDER BY  total_outstanding_loan_amount DESC;