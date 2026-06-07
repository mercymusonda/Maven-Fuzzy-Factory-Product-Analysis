-- To map the complete customer purchase journey across all stages of the Maven Fuzzy Factory website funnel
-- To measure how many sessions progress through each stage from entry point to completed purchase
-- To identify which stage experiences the highest drop off and represents the biggest opportunity for improvement

WITH entry AS (
    SELECT DISTINCT website_session_id
    FROM website_pageviews
    WHERE pageview_url IN ('/home','/lander-1','/lander-2',
    '/lander-3','/lander-4','/lander-5','/products',
    '/the-original-mr-fuzzy','/the-forever-love-bear',
    '/the-birthday-sugar-panda','/the-hudson-river-mini-bear')
),
cart AS (
    SELECT DISTINCT website_session_id
    FROM website_pageviews
    WHERE pageview_url = '/cart'
),
shipping AS (
    SELECT DISTINCT website_session_id
    FROM website_pageviews
    WHERE pageview_url = '/shipping'
),
billing AS (
    SELECT DISTINCT website_session_id
    FROM website_pageviews
    WHERE pageview_url IN ('/billing', '/billing-2')
),
thank_you AS (
    SELECT DISTINCT website_session_id
    FROM website_pageviews
    WHERE pageview_url = '/thank-you-for-your-order'
)
SELECT 'Entry Point' AS stage, COUNT(*) AS total FROM entry
UNION ALL
SELECT 'Cart' AS stage, COUNT(*) AS total FROM cart
UNION ALL
SELECT 'Shipping' AS stage, COUNT(*) AS total FROM shipping
UNION ALL
SELECT 'Billing' AS stage, COUNT(*) AS total FROM billing
UNION ALL
SELECT 'Completed Purchase' AS stage, COUNT(*) AS total FROM thank_you;