# Project 2 – Corporate Early-Warning Model (Wholesale Banking)

**Goal:** Build a simple *early-warning model* for a wholesale / corporate
loan book, using synthetic data that mimics how banks flag obligors at risk
of default over the next 12 months.

This project is based on my experience working with **large corporate**
customers rather than retail portfolios.

---

## Dataset

- `data/corp_rating_panel.csv`  
  Panel-style dataset with one row per **obligor-month**.

  Key columns:

  - `obligor_id`, `group_name`
  - `sector`, `country`
  - `rating_numeric` (internal 1–10 scale)
  - `rating_band` (Investment_Grade, Sub_IG, Watchlist, Default)
  - Financial ratios: `leverage`, `interest_coverage`, `ebitda_margin`
  - Behavioural / performance indicators:
    - `days_past_due`
    - `exposure_at_default`
  - Target label: `is_default` (1 if the obligor defaulted in the next 12 months)

`00_generate_ews_data.ipynb` (optional) shows how this synthetic panel can be
generated; in practice it would be replaced by an internal data mart.

---

## Key Questions

1. Which financial / behavioural indicators are most predictive of **1-year default**?
2. Can we build a basic early-warning model that clearly separates **good vs.
   bad** obligors?
3. How stable are results across different model families (logistic regression
   vs tree-based models)?

---

## Approach

1. **Exploratory analysis – `01_eda_early_warning.ipynb`**
   - Inspect default rates by:
     - rating band (IG / Sub-IG / Watchlist / Default)
     - sector and country
   - Look at how default rates change with:
     - higher leverage and lower interest coverage
     - higher days past due
   - Check data balance and basic data quality.

2. **Modeling – `02_early_warning_model.ipynb`**
   - Construct a **last-observation snapshot** per obligor:
     - Numeric features:
       - `rating_numeric`, `leverage`, `interest_coverage`,
         `ebitda_margin`, `days_past_due`, `exposure_at_default`
     - Categorical features:
       - `rating_band`, `sector`, `country`
     - Target: `is_default` (default within the next 12 months)
   - Train three baseline models with a shared preprocessing pipeline
     (imputation + scaling + one-hot encoding):
     - Logistic Regression
     - Random Forest
     - Gradient Boosting
   - Evaluate on a stratified train/test split using:
     - Accuracy
     - Precision / Recall / F1
     - ROC-AUC
     - Confusion matrix

   > Because the data is synthetic and was generated from a clear signal,
   > all three models reach **ROC-AUC ≈ 1.00** on the test set with perfect
   > classification metrics. In a real bank portfolio, results would be
   > meaningfully lower and additional work on calibration, stability, and
   > back-testing would be required.

3. **Model interpretation**
   - Use **Random Forest feature importances** to see which drivers matter most:
     - `rating_numeric` and `rating_band_*` dummy variables dominate
     - Followed by `leverage`, `days_past_due`, and `interest_coverage`
   - These are consistent with typical credit-risk expectations:
     weaker ratings, higher leverage, and more days past due drive default risk.

---

## Outputs

- **Notebooks**
  - `notebooks/01_eda_early_warning.ipynb` – EDA on the corporate rating / default panel.
  - `notebooks/02_early_warning_model.ipynb` – baseline early-warning models and feature importance.

- **Data**
  - `data/corp_rating_panel.csv` – synthetic monthly panel with ratings, ratios, and default flag.

- **Model artefacts (optional)**
  - Serialized models / pipelines (if saved) such as `models/rf_ews_model.joblib`
    to support reuse in scoring / dashboards.

---

## How this maps to real-world work

In a real wholesale bank, this type of early-warning model would be used to:

- Flag **high-risk obligors** for closer monitoring and relationship-manager
  review.
- Feed into **limit and pricing decisions** (tighter terms for higher-risk names).
- Support **portfolio-level stress testing**, by applying shocks to ratings or
  financial ratios and re-scoring the book.

Here I show the full modeling workflow with **clean, reproducible Python code**
on synthetic data that mirrors that process, without exposing any real bank or
customer information.
