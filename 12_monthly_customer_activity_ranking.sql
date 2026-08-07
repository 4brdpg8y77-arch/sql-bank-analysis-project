SELECT
c.customer_id,
c.customer_segment,
SUM(t.amount) AS total_transaction_amount,
DATE_TRUNC('month', t.transaction_date):: DATE AS month,
RANK() OVER (PARTITION BY DATE_TRUNC('month', transaction_date):: DATE
              ORDER BY SUM(t.amount) DESC) AS rank_amount
FROM customers AS c
INNER JOIN accounts AS a
ON c.customer_id = a.customer_id
INNER JOIN transactions AS t
ON a.account_id = t.account_id
GROUP BY c.customer_id , c.customer_segment, DATE_TRUNC('month', t.transaction_date):: DATE 
ORDER  BY month , rank_amount;