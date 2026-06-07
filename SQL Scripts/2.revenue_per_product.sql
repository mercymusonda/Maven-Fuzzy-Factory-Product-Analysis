
-- To evaluate the performance of each individual product within the Maven's catalogue
-- To compare revenue, cost and profit across all products and identify the strongest and weakest performers
-- To calculate profit margin percentage per product and assess which products are most efficient and profitable


SELECT 
    p.product_name,
    COUNT(oi.order_item_id) AS total_units_sold,
    SUM(oi.price_usd) AS total_revenue,
    SUM(oi.cogs_usd) AS total_cost,
    SUM(oi.price_usd - oi.cogs_usd) AS total_profit,
    ROUND(SUM(oi.price_usd - oi.cogs_usd) / SUM(oi.price_usd),2) * 100 AS profit_margin_percentage
FROM order_items oi
LEFT JOIN products p 
    ON oi.order_product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;
