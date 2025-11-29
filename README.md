# Corporate Banking Analytics Portfolio (Synthetic Data)

This repository showcases my **corporate / wholesale banking analytics** work
using fully synthetic data. It focuses on the types of analysis I did with
**large corporate customers** (not retail):

- Exposure & concentration analysis for a corporate loan book.
- Early-warning modeling to flag obligors at risk of default.
- Clean, reproducible Python / SQL / Power BI workflows.

All datasets are **synthetic and generated in Python**.  
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
  Corporate rating panel & early-warning default model:
  - synthetic obligor–quarter panel (`corp_rating_panel.csv`)
  - EDA on ratings, migrations, and default rates
  - baseline early-warning models (LogReg, Random Forest, Gradient Boosting)
  - feature importance and business interpretation

Each project has its own `README.md` that goes into more detail.

---

## Project 1 – Corporate Exposure & Concentration

**Goal:** Monitor large corporate exposures and concentration risk by obligor,
sector, and country, similar to a wholesale / corporate banking **limit and
portfolio monitoring** pack.

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

**Goal:** Build a simple **early-warning model** for a wholesale corporate
portfolio, predicting which obligors are most likely to default based on
internal ratings and early-warning indicators.

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
  - classification models (LogReg, tree-based methods)
- **BI & visualisation:** Power BI (and Tableau if needed)
- **Workflow:** Jupyter notebooks, Git/GitHub, clear project structure and
  documentation.

---

## How to run the notebooks

1. Clone the repository:

   ```bash
   git clone https://github.com/<YourUser>/corp-banking-analytics-portfolio.git
   cd corp-banking-analytics-portfolio
