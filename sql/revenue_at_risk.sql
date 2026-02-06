-- KPI: Revenue at risk ($) from pending claims

SELECT
    COUNT(*) AS pending_claims,
    ROUND(SUM (claim_amount),2) AS revenue_at_risk
FROM claims
WHERE claim_status = 'Pending';