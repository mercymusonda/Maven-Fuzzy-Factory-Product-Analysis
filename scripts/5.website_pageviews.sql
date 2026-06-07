
-- To identify the most visited pages on the Marven Fuzz Factory website
-- and understand customer navigation behaviour and drop off points


SELECT
    pageview_url,
    COUNT(DISTINCT website_session_id) AS total_sessions
FROM
    website_pageviews
GROUP BY
    pageview_url
ORDER BY
    total_sessions DESC;
