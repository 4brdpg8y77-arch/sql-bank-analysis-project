SELECT
    customer_id,
    customer_segment,
    total_transaction_amount
FROM (
    SELECT
        c.customer_id,
        c.customer_segment,
        SUM(t.amount) AS total_transaction_amount
    FROM customers AS c
    INNER JOIN accounts AS a
        ON c.customer_id = a.customer_id
    INNER JOIN transactions AS t
        ON a.account_id = t.account_id
    GROUP BY
        c.customer_id,
        c.customer_segment
) AS customer_transactions
WHERE total_transaction_amount > (
    SELECT AVG(total_transaction_amount)
    FROM (
        SELECT
            SUM(t.amount) AS total_transaction_amount
        FROM customers AS c
        INNER JOIN accounts AS a
            ON c.customer_id = a.customer_id
        INNER JOIN transactions AS t
            ON a.account_id = t.account_id
        GROUP BY c.customer_id
    ) AS average_transactions
)
ORDER BY total_transaction_amount DESC;