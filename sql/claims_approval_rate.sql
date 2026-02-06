--KPI: Approval/ Denial/ Pending counts and Approval Rate (%) by insurance provider

SELECT
    insurance_provider,
    COUNT (*) AS total_claims,
    SUM(CASE WHEN claim_status = 'Approved' THEN 1 ELSE 0 END) AS approved_claims,
    SUM(CASE WHEN claim_status = 'Denied' THEN 1 ELSE 0 END) AS denied_claims,
    SUM(CASE WHEN claim_status = 'Pending' THEN 1 ELSE 0 END) AS pending_claims,
    ROUND(
        100.0 * SUM(CASE WHEN claim_status = 'Approved' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS approval_rate_pct
FROM claims
GROUP BY insurance_provider
ORDER BY approval_rate_pct DESC;
