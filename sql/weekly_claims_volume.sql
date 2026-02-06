-- KPI: Weekly claims volume based on submission_date

SELECT
  strftime('%Y-%W', submission_date) AS year_week,
  COUNT(*) AS claims_submitted
FROM claims
WHERE submission_date IS NOT NULL
GROUP BY year_week
ORDER BY year_week;