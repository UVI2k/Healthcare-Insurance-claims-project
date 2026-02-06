-- KPI: Denial reasons distribution + percent of all denials

SELECT
  denial_reason,
  COUNT(*) AS denial_count,
  ROUND(
    100.0 * COUNT(*) / (SELECT COUNT(*) FROM claims WHERE claim_status = 'Denied'),
    2
  ) AS pct_of_denials
FROM claims
WHERE claim_status = 'Denied'
GROUP BY denial_reason
ORDER BY denial_count DESC;