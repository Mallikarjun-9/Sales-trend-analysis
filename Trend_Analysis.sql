CREATE TABLE online_sales (
    invoice_no TEXT,
    stock_code TEXT,
    description TEXT,
    quantity INTEGER,
    invoice_date TEXT,
    unit_price NUMERIC,
    customer_id TEXT,
    country TEXT
);
select * from online_sales;

SELECT 
  EXTRACT(YEAR FROM TO_TIMESTAMP(invoice_date, 'DD-MM-YYYY HH24:MI')) AS order_year,
  EXTRACT(MONTH FROM TO_TIMESTAMP(invoice_date, 'DD-MM-YYYY HH24:MI')) AS order_month,
  SUM(unit_price * quantity) AS total_revenue,
  COUNT(DISTINCT invoice_no) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

