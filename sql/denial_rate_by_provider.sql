-- KPI: Denial rate (%) by insurance provider

SELECT
  insurance_provider,
  COUNT(*) AS total_claims,
  SUM(CASE WHEN claim_status = 'Denied' THEN 1 ELSE 0 END) AS denied_claims,
  ROUND(
    100.0 * SUM(CASE WHEN claim_status = 'Denied' THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS denial_rate_pct
FROM claims
GROUP BY insurance_provider
ORDER BY denial_rate_pct DESC;