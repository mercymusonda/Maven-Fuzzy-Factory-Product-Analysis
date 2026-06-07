-- To measure the conversion rate of each individual traffic source driving visitors to the Marven Fuzzy Factory website
-- To identify which traffic sources are most effective at converting sessions into actual purchases
-- To inform marketing budget allocation by highlighting high and low performing traffic sources

SELECT 
    ws.utm_source,
    COUNT(DISTINCT ws.website_session_id) AS total_sessions,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(COUNT(DISTINCT o.order_id) * 100.0 / 
    COUNT(DISTINCT ws.website_session_id), 2) AS conversion_rate
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id
GROUP BY ws.utm_source
ORDER BY conversion_rate DESC;