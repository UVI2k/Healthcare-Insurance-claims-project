import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random

# Reproducibility
np.random.seed(42)
random.seed(42)

NUM_CLAIMS = 1200

# Insurance providers (Medicare-heavy)
insurance_providers = [
    "Medicare",
    "Medicare Advantage - Aetna",
    "Medicare Advantage - United",
    "Medicare Advantage - Blue Cross",
    "Private - Other"
]

claim_statuses = ["Approved", "Denied", "Pending"]

denial_reasons = [
    "Missing Documentation",
    "Service Not Covered",
    "Incorrect Coding",
    "Duplicate Claim",
    "Eligibility Issue"
]

start_date = datetime(2024, 1, 1)
end_date = datetime(2024, 12, 31)

def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end - start).days))

rows = []

for i in range(NUM_CLAIMS):
    claim_id = f"CLM-{100000+i}"
    patient_id = f"PT-{random.randint(10000,99999)}"
    provider = random.choices(
        insurance_providers,
        weights=[0.45, 0.2, 0.15, 0.1, 0.1]
    )[0]

    service_date = random_date(start_date, end_date)
    submission_date = service_date + timedelta(days=random.randint(1, 5))

    status = random.choices(
        claim_statuses,
        weights=[0.65, 0.2, 0.15]
    )[0]

    decision_date = None
    payment_date = None
    denial_reason = None
    approved_amount = 0
    days_to_decision = None
    days_to_payment = None

    claim_amount = round(random.uniform(80, 250), 2)

    if status != "Pending":
        decision_date = submission_date + timedelta(days=random.randint(3, 20))
        days_to_decision = (decision_date - submission_date).days

        if status == "Approved":
            approved_amount = round(claim_amount * random.uniform(0.85, 1.0), 2)
            payment_date = decision_date + timedelta(days=random.randint(5, 25))
            days_to_payment = (payment_date - decision_date).days

        else:  # Denied
            denial_reason = random.choice(denial_reasons)

    rows.append([
        claim_id,
        patient_id,
        provider,
        service_date.date(),
        submission_date.date(),
        decision_date.date() if decision_date else None,
        payment_date.date() if payment_date else None,
        claim_amount,
        approved_amount,
        status,
        denial_reason,
        days_to_decision,
        days_to_payment
    ])

columns = [
    "claim_id",
    "patient_id",
    "insurance_provider",
    "service_date",
    "submission_date",
    "decision_date",
    "payment_date",
    "claim_amount",
    "approved_amount",
    "claim_status",
    "denial_reason",
    "days_to_decision",
    "days_to_payment"
]

df = pd.DataFrame(rows, columns=columns)

# Save CSV
df.to_csv("claims.csv", index=False)

print("✅ Synthetic claims data generated successfully!")
print(df.head())
