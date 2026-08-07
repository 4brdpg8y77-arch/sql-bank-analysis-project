WITH customer_loans AS (
    SELECT
        c.customer_id,
        c.customer_segment,
        c.annual_income,
        SUM(l.loan_amount) AS total_loan_amount
    FROM customers AS c
    INNER JOIN loans AS l
        ON c.customer_id = l.customer_id
    GROUP BY
        c.customer_id,
        c.customer_segment,
        c.annual_income
)
SELECT
    customer_id,
    customer_segment,
    annual_income,
    total_loan_amount,
    total_loan_amount - annual_income AS difference
FROM customer_loans
WHERE total_loan_amount > annual_income
ORDER BY difference DESC;