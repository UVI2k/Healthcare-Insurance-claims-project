-- KPI: Average decision and payment timelines by insurance provider (Approved claims only)

SELECT
  insurance_provider,
  COUNT(*) AS approved_claims,
  ROUND(AVG(days_to_decision), 2) AS avg_days_to_decision,
  ROUND(AVG(days_to_payment), 2) AS avg_days_to_payment,
  ROUND(AVG(approved_amount), 2) AS avg_approved_amount
FROM claims
WHERE claim_status = 'Approved'
GROUP BY insurance_provider
ORDER BY avg_days_to_payment DESC;