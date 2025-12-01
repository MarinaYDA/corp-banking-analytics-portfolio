# Corporate Banking Analytics Portfolio (Synthetic Data)

This repository shows how I would approach **corporate / wholesale banking
analytics today**, using fully synthetic data.

In my **real banking experience**, I worked with **large corporate customers**
(mainly using **SQL and Excel**) to:

- extract and clean data from internal systems,
- build exposure / limit reports,
- support risk and portfolio-analysis teams.

This portfolio takes that corporate-banking context and extends it with
modern **Python + modeling** on synthetic datasets to demonstrate my current
skills for Data Analyst / Data Scientist / Analytics roles.

All datasets here are **synthetic and generated in Python**.  
No real bank, customer, or exposure data is used.

---

## Repository structure

- `project1_corp_exposure_dashboard/`  
  Corporate exposure & concentration dashboard:
  - synthetic facility-level exposure snapshot (`corp_exposure_snapshot.csv`)
  - limits table for single-name / sector / country
  - EDA & concentration notebooks
  - Power BI **“Corporate Exposure Overview”** page
  - written business summary for risk / portfolio stakeholders

- `project2_corp_rating_early_warning/`  
  Corporate rating panel & early-warning modeling:
  - synthetic obligor–quarter panel (`corp_rating_panel.csv`)
  - EDA on ratings, migrations, and default rates
  - baseline early-warning models (LogReg, Random Forest, Gradient Boosting)
  - feature importance and business interpretation

Each project has its own `README.md` that goes into more detail and clearly
states that the work is **synthetic** and goes beyond what I did in my prior
banking role.

---

## Project 1 – Corporate Exposure & Concentration

**Goal:** Recreate a simple **exposure and concentration pack** for large
corporate obligors, similar to what is used in wholesale / corporate banking
to monitor single-name, sector, and country concentrations.

This project is **inspired by the type of data and reports** I worked with in
banking (SQL + Excel), but:

- the data is **fully synthetic**, and
- all Python / Power BI elements are built specifically for this portfolio.

Highlights:

- Facility-level snapshot with:
  - limits, outstanding, undrawn
  - internal ratings, sectors, countries, maturity dates
- Concentration analysis:
  - Top 20 groups, sector and country shares
  - simple limit utilisation metrics from `corp_limits.csv`
- Power BI dashboard:
  - KPI cards for total limits / outstanding / undrawn / utilisation
  - sector and country bar charts
  - rating-band distribution
  - Top 20 groups table with exposure, portfolio share, and headroom vs limits

See `project1_corp_exposure_dashboard/README.md` for details.

---

## Project 2 – Corporate Early-Warning Model

**Goal:** On top of a synthetic corporate rating panel, build simple
**early-warning models** to predict which obligors are more likely to default,
using ratings, financial ratios, and behavioural indicators.

In my **real banking job**, I worked on:

- extracting and cleaning corporate exposure data,
- building portfolio and concentration views,
- supporting risk teams with SQL/Excel analysis.

The **modeling in this project is new work**, created specifically to show that
I can take similar corporate data structures and build:

- EDA on ratings and default patterns,
- baseline classification models for early warning,
- interpretable feature importance and business explanations.

Highlights:

- Synthetic obligor–quarter panel with:
  - internal ratings (1–10) and rating bands (IG / Sub-IG / Watchlist / Default)
  - financial ratios (leverage, interest coverage, EBITDA margin)
  - behavioural signals (days past due)
  - exposure_at_default and `is_default` flag
- EDA notebook:
  - rating distributions and migration behaviour
  - default rates by rating band
  - how leverage / coverage / DPD behave for defaulted vs non-defaulted names
- Modeling notebook:
  - shared preprocessing pipeline (imputation, scaling, one-hot encoding)
  - Logistic Regression, Random Forest, Gradient Boosting
  - evaluation with ROC-AUC, precision/recall, confusion matrices
  - feature importance to confirm intuitive risk drivers

See `project2_corp_rating_early_warning/README.md` for details.

---

## Tools & stack

- **Languages:** Python (pandas, scikit-learn), SQL
- **Analytics / modeling:**
  - EDA, concentration metrics, rating migration
  - classification models (LogReg, tree-based methods) on synthetic data
- **BI & visualisation:** Power BI 
- **Workflow:** Jupyter notebooks, Git/GitHub, clear project structure and
  documentation.

---

## How to run the notebooks

1. Clone the repository:

   ```bash
   git clone https://github.com/<YourUser>/corp-banking-analytics-portfolio.git
   cd corp-banking-analytics-portfolio
