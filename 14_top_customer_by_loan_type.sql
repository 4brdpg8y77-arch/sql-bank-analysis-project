WITH loan_amount AS (
    SELECT
        l.loan_type,
        c.customer_id,
        c.customer_segment,
        SUM(l.loan_amount) AS total_loan_amount
    FROM loans AS l
    INNER JOIN customers AS c
        ON l.customer_id = c.customer_id
    GROUP BY
        l.loan_type,
        c.customer_id,
        c.customer_segment
),
loan_ranking AS (
    SELECT
        loan_type,
        customer_id,
        customer_segment,
        total_loan_amount,
        ROW_NUMBER() OVER (
            PARTITION BY loan_type
            ORDER BY total_loan_amount DESC
        ) AS row_num
    FROM loan_amount
)
SELECT
    loan_type,
    customer_id,
    customer_segment,
    total_loan_amount
FROM loan_ranking
WHERE row_num = 1
ORDER BY total_loan_amount DESC;