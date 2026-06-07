-- To analyse website traffic and conversion performance broken down by source, campaign and device type
-- To identify which combination of traffic source, campaign and device drives the highest number of sessions and orders
-- To evaluate how device type influences purchasing behaviour across different traffic sources and campaigns

SELECT 
    ws.utm_source,
    ws.utm_campaign,
    ws.device_type,
    COUNT(DISTINCT ws.website_session_id) AS total_sessions,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(COUNT(DISTINCT o.order_id) * 100.0 / 
    COUNT(DISTINCT ws.website_session_id), 2) AS conversion_rate
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id
GROUP BY ws.utm_source, ws.utm_campaign, ws.device_type
ORDER BY total_sessions DESC;