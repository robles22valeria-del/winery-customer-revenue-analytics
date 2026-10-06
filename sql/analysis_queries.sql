USE winery_analytics;

-- 1. Executive KPIs
SELECT COUNT(*) AS transactions,
       ROUND(SUM(total_amount),2) AS total_revenue,
       ROUND(AVG(total_amount),2) AS avg_transaction_value
FROM transaction_record;

-- 2. Revenue and units by wine
SELECT w.wine_name,
       SUM(ti.quantity) AS units_sold,
       ROUND(SUM(ti.quantity * ti.unit_price),2) AS gross_product_revenue
FROM transaction_item ti
JOIN wine w ON ti.wine_id = w.wine_id
GROUP BY w.wine_id, w.wine_name
ORDER BY gross_product_revenue DESC;

-- 3. Revenue by wine type
SELECT w.wine_type,
       ROUND(SUM(ti.quantity * ti.unit_price),2) AS revenue
FROM transaction_item ti
JOIN wine w ON ti.wine_id = w.wine_id
GROUP BY w.wine_type
ORDER BY revenue DESC;

-- 4. Revenue by month
SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS month,
       ROUND(SUM(total_amount),2) AS revenue,
       COUNT(*) AS transactions
FROM transaction_record
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY month;

-- 5. Tasting experience performance
SELECT v.tasting_type,
       COUNT(DISTINCT v.visit_id) AS visits,
       COUNT(DISTINCT tr.transaction_id) AS purchasing_transactions,
       ROUND(COALESCE(SUM(tr.total_amount),0),2) AS revenue
FROM visit v
LEFT JOIN transaction_record tr ON v.visit_id = tr.visit_id
GROUP BY v.tasting_type
ORDER BY revenue DESC;

-- 6. Member vs non-member customer spend
SELECT CASE WHEN m.customer_id IS NULL THEN 'Non-Member' ELSE 'Member' END AS customer_type,
       COUNT(DISTINCT c.customer_id) AS customers,
       ROUND(COALESCE(SUM(tr.total_amount),0),2) AS revenue,
       ROUND(COALESCE(SUM(tr.total_amount),0) / NULLIF(COUNT(DISTINCT c.customer_id),0),2) AS revenue_per_customer
FROM customer c
LEFT JOIN membership m ON c.customer_id = m.customer_id AND m.membership_status = 'Active'
LEFT JOIN visit v ON c.customer_id = v.customer_id
LEFT JOIN transaction_record tr ON v.visit_id = tr.visit_id
GROUP BY customer_type;

-- 7. Top customers by lifetime revenue
SELECT c.customer_id,
       CONCAT(c.first_name,' ',c.last_name) AS customer_name,
       ROUND(SUM(tr.total_amount),2) AS lifetime_revenue
FROM customer c
JOIN visit v ON c.customer_id = v.customer_id
JOIN transaction_record tr ON v.visit_id = tr.visit_id
GROUP BY c.customer_id, customer_name
ORDER BY lifetime_revenue DESC
LIMIT 10;

-- 8. Reservation vs walk-in performance
SELECT v.reservation_type,
       COUNT(DISTINCT v.visit_id) AS visits,
       ROUND(COALESCE(SUM(tr.total_amount),0),2) AS revenue
FROM visit v
LEFT JOIN transaction_record tr ON v.visit_id = tr.visit_id
GROUP BY v.reservation_type;

-- 9. Geographic customer mix
SELECT state, COUNT(*) AS customers
FROM customer
GROUP BY state
ORDER BY customers DESC;

-- 10. Wine club membership mix
SELECT membership_tier, membership_status, COUNT(*) AS members
FROM membership
GROUP BY membership_tier, membership_status
ORDER BY membership_tier, membership_status;
