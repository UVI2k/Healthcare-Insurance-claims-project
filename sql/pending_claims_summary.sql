-- KPI: Pending claims count + $ grouped by follow-up priority

WITH pending AS (
  SELECT
    claim_id,
    claim_amount,
    submission_date,
    CAST(julianday('now') - julianday(submission_date) AS INTEGER) AS days_pending,
    CASE
      WHEN julianday('now') - julianday(submission_date) > 30 THEN 'Critical'
      WHEN julianday('now') - julianday(submission_date) > 14 THEN 'High'
      ELSE 'Normal'
    END AS followup_priority
  FROM claims
  WHERE claim_status = 'Pending'
    AND submission_date IS NOT NULL
)
SELECT
  followup_priority,
  COUNT(*) AS pending_claims,
  ROUND(SUM(claim_amount), 2) AS pending_amount
FROM pending
GROUP BY followup_priority
ORDER BY
  CASE followup_priority
    WHEN 'Critical' THEN 1
    WHEN 'High' THEN 2
    ELSE 3
  END;
