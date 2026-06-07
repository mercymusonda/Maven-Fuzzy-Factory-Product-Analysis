-- To analyse monthly website traffic trends broken down by each traffic source
-- To identify which sources consistently drive the most sessions over time and detect seasonal patterns
-- To support marketing budget decisions by highlighting which sources grow, decline or remain stable month on month

SELECT 
    DATE_TRUNC('month', created_at) AS month,
    utm_source,
    COUNT(DISTINCT website_session_id) AS total_sessions
FROM website_sessions
GROUP BY month, utm_source
ORDER BY month, total_sessions DESC;