
-- To identify which traffic sources and marketing campaigns are driving the most sessions and orders to the Maven Fuzzy Factory website
-- To measure the conversion rate of each campaign and determine which channels are most effective at turning visitors into buyers
-- To highlight underperforming campaigns with low conversion rates that may require review or reallocation of marketing budget

SELECT 
    ws.utm_source,
    ws.utm_campaign,
    COUNT(DISTINCT ws.website_session_id) AS total_sessions,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(COUNT(DISTINCT o.order_id) * 100.0 / 
    COUNT(DISTINCT ws.website_session_id), 2) AS conversion_rate
FROM website_sessions ws
LEFT JOIN orders o 
    ON ws.website_session_id = o.website_session_id
GROUP BY ws.utm_source, ws.utm_campaign
ORDER BY total_sessions DESC;