WITH loan_amount AS (
SELECT
c.customer_id,
c.customer_segment,
c.credit_score,
SUM(l.loan_amount) AS total_loan_amount,
COUNT(DISTINCT l.loan_id) AS number_of_loans,
ROUND(AVG(l.interest_rate),2) AS avg_interest_rate
FROM customers AS c
INNER JOIN loans AS l
ON c.customer_id = l.customer_id
GROUP BY c.customer_id,c.customer_segment,c.credit_score
)
SELECT
customer_id,
customer_segment,
credit_score,
total_loan_amount,
number_of_loans,
avg_interest_rate,
RANK() OVER(ORDER BY total_loan_amount DESC) AS rank_amount
FROM loan_amount
WHERE total_loan_amount > (
SELECT
ROUND(AVG(total_loan_amount),2) AS avg_total_loan_amount
FROM loan_amount
)
ORDER BY rank_amount ;