USE memory.default;

WITH invoice_data AS (
    SELECT 
        i.supplier_id,
        s.name AS supplier_name,
        i.invoice_amount AS amount_due,
        i.due_date,
        -- Last day month for payment
        DATE_ADD('day', -1, DATE_TRUNC('month', i.due_date + INTERVAL '1' month)) AS payment_date
    FROM sexi_invoice i
    JOIN sexi_supplier s ON i.supplier_id = s.supplier_id
),
aggregated_payments AS (
    SELECT
        supplier_id,
        supplier_name,
        SUM(amount_due) AS payment_amount,
        SUM(SUM(amount_due)) OVER (PARTITION BY supplier_id ORDER BY payment_date DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) - SUM(amount_due) AS balance_outstanding,
        payment_date
    FROM invoice_data
    GROUP BY supplier_id, supplier_name, payment_date
)
SELECT * FROM aggregated_payments
ORDER BY supplier_id ASC, payment_date ASC;
