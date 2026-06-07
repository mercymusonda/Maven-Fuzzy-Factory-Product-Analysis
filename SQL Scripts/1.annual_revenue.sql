
-- To analyse the annual financial performance of Marven Fuzzy Factory across all available years
-- To track the growth and decline of revenue, costs and profit over time
-- To calculate profit margin percentage and assess pricing and cost efficiency year on year


SELECT
    EXTRACT(YEAR FROM created_at) AS year,
    COUNT(order_id) AS total_orders,
    SUM(price_usd) AS total_revenue,
    SUM(cogs_usd) AS total_costs,
    SUM(price_usd - cogs_usd) AS total_profit,
    ROUND((SUM(price_usd - cogs_usd) / SUM(price_usd)) * 100, 2) AS profit_margin_percentage
FROM orders
GROUP BY year
ORDER BY year;
