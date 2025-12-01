# Project 2 – Corporate Rating Panel & Early-Warning Modeling

**Goal:** On a synthetic corporate rating panel, explore how internal ratings,
financial ratios, and behavioural indicators relate to default, and build
simple **early-warning models** that predict which obligors are higher risk.

In my **real banking work with large corporates**, I used **SQL and Excel** to:

- pull and clean rating / exposure data from internal systems,
- support risk and portfolio teams with descriptive analysis and reporting.

I did **not** run Random Forests or ML models in production at the bank.
The modeling here is **new work**, built specifically for this portfolio to
show how I would extend that kind of corporate data today with Python-based
EDA and baseline models.

All data in this project is **synthetic**.

---

## Dataset

- `data/corp_rating_panel.csv`  
  Panel-style dataset with one row per **obligor–quarter**.

  Key columns:

  - `obligor_id`, `obligor_name`, `group_id`, `group_name`
  - `sector`, `country`
  - `as_of_date`
  - `rating_numeric` (internal 1–10 scale)
  - `rating_band` (Investment_Grade, Sub_IG, Watchlist, Default)
  - Financial ratios:
    - `leverage`
    - `interest_coverage`
    - `ebitda_margin`
  - Behavioural / performance indicators:
    - `days_past_due`
    - `exposure_at_default`
  - Target label:
    - `is_default` (1 if the obligor is in default at that snapshot)

`00_generate_corp_rating_data.ipynb` shows how this synthetic panel is
constructed. In a real bank, these data would come from rating systems,
financial spreading tools, and internal risk data marts.

---

## Key Questions

1. How are obligors distributed across **rating buckets and rating bands**?
2. What do **rating migrations** look like over time (upgrades, downgrades, stability)?
3. How do **default rates** differ by rating band?
4. Which financial / behavioural features (leverage, coverage, days past due)
   distinguish **defaulted vs non-defaulted** obligors?
5. Can simple baseline models separate higher-risk and lower-risk obligors
   in a realistic way (on synthetic data)?

---

## Approach

1. **Data generation (`00_generate_corp_rating_data.ipynb`)**  
   - Generate a synthetic obligor–quarter panel.
   - Simulate rating paths over time (1–10) with upgrades/downgrades.
   - Create early-warning features correlated with rating:
     - leverage, interest coverage, EBITDA margin
     - days past due, exposure_at_default
   - Derive `is_default` and `is_watchlist` flags.

2. **EDA & rating migration (`01_eda_rating_migration.ipynb`)**  
   - Explore distributions of `rating_numeric` and `rating_band`.
   - Build **migration matrices**:
     - numeric rating (current vs next)
     - rating band (IG / Sub-IG / Watchlist / Default)
   - Compute **default rates by rating band** using final snapshots.
   - Compare early-warning features (leverage, coverage, DPD) across:
     - rating bands
     - default vs non-default groups

3. **Early-warning models (`02_early_warning_model.ipynb`)**  
   - Construct a **final-snapshot dataset** (one row per obligor).
   - Features:
     - Numeric: `rating_numeric`, `leverage`, `interest_coverage`,
       `ebitda_margin`, `days_past_due`, `exposure_at_default`
     - Categorical: `rating_band`, `sector`, `country`
   - Target: `is_default`.
   - Shared preprocessing pipeline:
     - imputation (median / most frequent)
     - scaling for numeric features
     - one-hot encoding for categorical features
   - Baseline models:
     - Logistic Regression (with class_weight for imbalance)
     - Random Forest
     - Gradient Boosting
   - Evaluation:
     - Accuracy, precision, recall, ROC-AUC
     - Confusion matrices
     - ROC curves
   - Interpretation:
     - Random Forest feature importances to confirm intuitive drivers:
       weaker ratings, higher leverage, more days past due, lower coverage.

---

## Outputs

- **Data**
  - `data/corp_rating_panel.csv` – synthetic corporate rating & default panel.

- **Notebooks**
  - `notebooks/00_generate_corp_rating_data.ipynb` – synthetic data generator.
  - `notebooks/01_eda_rating_migration.ipynb` – EDA, rating distributions, and migration matrices.
  - `notebooks/02_early_warning_model.ipynb` – baseline early-warning models and feature importance.

- **(Optional) Model artefacts**
  - If needed, serialized models could be saved in a `models/` folder for
    reuse in scoring or dashboards.

---

## Relationship to my real banking experience

- In my **actual bank roles**, I:
  - worked with **large corporate portfolios** (not retail),
  - wrote a lot of **SQL** to extract and clean data,
  - and used **Excel** to build exposure reports, limits views, and ad-hoc analysis.

- In this **portfolio project**, I:
  - recreate similar **corporate structures** with synthetic data,
  - and extend them with **Python-based EDA and baseline modeling** that I did
    not do in the bank environment.

The aim is to show that I understand **corporate credit risk concepts** from
my prior experience, and that I can now apply **modern data and modeling tools**
to that domain in a clean, reproducible way.
