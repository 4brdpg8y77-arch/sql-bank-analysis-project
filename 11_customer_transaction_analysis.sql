SELECT
c.customer_id,
c.customer_segment,
COUNT(DISTINCT a.account_id) AS number_of_accounts,
SUM(t.amount) AS total_transaction_amount,
RANK() OVER (ORDER BY SUM(t.amount) DESC) AS rank_amount
FROM customers AS c
INNER JOIN accounts AS a
ON c.customer_id = a.customer_id
INNER JOIN transactions AS t
ON a.account_id = t.account_id
GROUP BY c.customer_id , c.customer_segment
ORDER  BY rank_amount;