--KPI: Claims Aging Buckets based kon days to decision

SELECT
    CASE
        WHEN days_to_decision IS NULL THEN 'No Decision Yet'
        WHEN days_to_decision <= 7 THEN '0-7 days'
        WHEN days_to_decision <= 14 THEN '8-14 days'
        WHEN days_to_decision <= 30 THEN '15-30 days'
        ELSE '31+ days'
    END AS aging_bucket,
    COUNT(*) AS claim_count
FROM claims
GROUP BY aging_bucket
ORDER BY claim_count DESC;