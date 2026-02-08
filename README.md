# Healthcare Insurance Claims Operations Analytics

## Project Overview
This project demonstrates an end-to-end **healthcare insurance claims analytics workflow**, focused on **operational performance, revenue cycle insights, and process improvement**. Using synthetic but realistic claims data, the project simulates how healthcare organizations analyze approvals, denials, reimbursement delays, and pending claims to support data-driven decision-making.

The solution is designed to mirror **real-world healthcare operations and Revenue Cycle Management (RCM)** environments and is suitable for **junior / entry-level data analyst roles** in healthcare, operations, and startup settings.

## Live Dashboard
🔗 **View the interactive Looker Studio dashboard:**  
👉 [Healthcare Insurance Claims Operations Dashboard](https://lookerstudio.google.com/reporting/a663b4c7-fa93-469a-8877-56fac8239eee))

> The dashboard is view-only and hosted on Looker Studio.  
> It includes Executive Summary, Operations & Worklist, and Denials & Process Improvement pages.


---

## Objectives
- Analyze claims approval, denial, and pending trends across insurance providers  
- Quantify **revenue at risk** due to delayed or pending claims  
- Identify **denial drivers** and provider-level performance gaps  
- Build an **operational worklist** to prioritize claims follow-up  
- Present insights through an **executive- and operations-ready dashboard**

---

## Data
- **Source:** Synthetic healthcare insurance claims data  
- **Volume:** 1,200 claims  
- **Key fields include:**
  - Claim status (Approved / Denied / Pending)  
  - Insurance provider  
  - Claim and approved amounts  
  - Submission, decision, and payment timelines  
  - Denial reasons and aging metrics  

> **Note:** No real patient or insurance data is used. This project is HIPAA-safe and intended for portfolio demonstration only.

---

## Project Workflow


### 1. Data Validation
- Performed structured validation checks to ensure:
  - Correct claim lifecycle sequencing (service → submission → decision → payment)
  - Consistency between claim status and monetary values
  - Valid derived metrics (days to decision, days to payment)
  - Absence of invalid or contradictory records

### 2. SQL Analytics (SQLite)
- Developed reusable SQL queries to calculate:
  - Approval and denial rates by provider  
  - Revenue at risk from pending claims  
  - Claims aging distribution  
  - Denial reason breakdown  
  - Reimbursement timelines  
  - Priority-based operational follow-up worklists  

### 3. Dashboard Data Preparation
- Exported SQL query results as clean, dashboard-ready CSV files.

### 4. Visualization (Looker Studio)
- Built a **three-page interactive dashboard** using Google Sheets as the data source.

---

## Dashboard Pages

### Executive Summary
- Overall approval and denial rates  
- Claims volume by insurance provider  
- Revenue at risk from pending claims  
- Top denial drivers  

**Purpose:** Provide leadership with a fast, high-level view of claims health and financial impact.
<img width="520" height="512" alt="Screenshot 2026-02-07 173301" src="https://github.com/user-attachments/assets/41ad7b7e-5db4-40c2-94a5-400797b1d56b" />

---

### Operations & Worklist
- Pending claims count and dollar value  
- Claims aging distribution  
- Priority-based follow-up worklist (High / Critical)  
- Provider-level filtering for operational focus  

**Purpose:** Enable daily operational decision-making and prioritization.
<img width="806" height="708" alt="Screenshot 2026-02-07 173342" src="https://github.com/user-attachments/assets/ec706a8e-7c9b-4726-aefe-1dac1aa8b2e6" />

---

### Denials & Process Improvement
- Denial reason distribution  
- Denial rate by provider  
- Denials versus claims volume comparison  
- Processing time context for approved claims  

**Purpose:** Identify root causes of denials and recommend targeted process improvements.
<img width="512" height="590" alt="Screenshot 2026-02-07 173410" src="https://github.com/user-attachments/assets/428ba58f-655d-4d03-bdbc-b29f4cfe3a7a" />

---

## Key Insights
- Approval rates vary across insurance providers, indicating payer-specific operational challenges  
- A meaningful portion of revenue is delayed due to claims pending beyond standard processing timelines  
- Documentation and eligibility issues are the primary drivers of claim denials  
- Prioritizing follow-ups based on claim aging and value can reduce backlog and improve cash flow  

---

## Tools & Technologies
- **Python** (pandas, numpy) – data generation and validation  
- **SQLite** – SQL analytics and KPI computation  
- **SQL** – operational and analytical queries  
- **Google Sheets** – cloud-based data sources  
- **Looker Studio** – interactive dashboards  
- **Git & GitHub** – version control and project management  

---

