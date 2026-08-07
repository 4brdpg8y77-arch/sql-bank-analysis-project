SELECT
c.customer_id,
c.customer_segment,
SUM(l.loan_amount) AS total_loan_amount,
RANK ()OVER(ORDER BY SUM(l.loan_amount) DESC) AS loan_rank
FROM customers AS c
INNER JOIN loans AS l
ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.customer_segment
ORDER BY total_loan_amount DESC;