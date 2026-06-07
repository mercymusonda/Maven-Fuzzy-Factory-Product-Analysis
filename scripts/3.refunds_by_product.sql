
-- To identify which products are being refunded the most and track refund trends across each year
-- To assess the financial impact of refunds on each product by measuring total refund amounts annually

SELECT 
    EXTRACT(YEAR FROM r.created_at) AS refund_year,
    p.product_name,
    COUNT(r.order_item_refund_id) AS total_refunds,
    SUM(r.refund_amount_usd) AS total_refund_amount
FROM order_item_refunds r
LEFT JOIN order_items oi 
    ON r.order_item_id = oi.order_item_id
LEFT JOIN products p 
    ON oi.order_product_id = p.product_id
GROUP BY refund_year, p.product_name
ORDER BY refund_year, total_refunds DESC;