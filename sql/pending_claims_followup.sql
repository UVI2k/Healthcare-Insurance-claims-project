-- Use: Identify claims requiring immediate follow-up to reduce revenue delays

SELECT
  claim_id,
  patient_id,
  insurance_provider,
  submission_date,
  claim_amount,
  CAST(
    julianday('now') - julianday(submission_date)
    AS INTEGER
  ) AS days_pending,
  CASE
    WHEN julianday('now') - julianday(submission_date) > 30 THEN 'Critical'
    WHEN julianday('now') - julianday(submission_date) > 14 THEN 'High'
    ELSE 'Normal'
  END AS followup_priority
FROM claims
WHERE claim_status = 'Pending'
  AND submission_date IS NOT NULL
  AND julianday('now') - julianday(submission_date) > 14
ORDER BY followup_priority DESC, days_pending DESC;