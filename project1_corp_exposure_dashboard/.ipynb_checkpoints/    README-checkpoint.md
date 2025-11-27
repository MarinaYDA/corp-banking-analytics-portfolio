# Project 1 – Corporate Exposure & Concentration Dashboard

**Goal:** Monitor large corporate exposures and concentration risk by
obligor, sector, and country, similar to the reporting used in wholesale /
corporate banking.

This project uses synthetic data to mirror the type of portfolio- and
limit-monitoring work I did with large corporate customers.

---

## Dataset

- `data/corp_exposure_snapshot.csv`  
  One row per **facility** (loan, revolver, guarantee, etc.) for a large
  corporate obligor.

  Key columns (subset):

  - `facility_id`, `obligor_id`, `group_id`, `obligor_name`, `group_name`
  - `country`, `region`, `sector`
  - `internal_rating` (e.g. 1–10) and `rating_band` (e.g. Investment_Grade, Sub_IG, Watchlist)
  - `product_type` (Term_Loan, Revolver, Guarantee, etc.)
  - `currency`, `limit_amount`, `outstanding_amount`, `undrawn_amount`
  - `collateral_value`, `maturity_date`, `origination_date`
  - `is_defaulted` (0/1)

- `data/corp_limits.csv` 
  Simple limit table to illustrate **single-name, sector, and country limits**.

  Example columns:

  - `limit_type` (SingleName, Sector, Country)
  - `dimension_value` (e.g. group_name, sector name, country)
  - `limit_amount`
  - `warning_threshold_pct` (e.g. 0.8 for 80% of limit)
  - `responsible_unit`, `last_review_date`

See `docs/project1_data_dictionary.txt` for full column descriptions.

---

## Key Questions

1. What is the **total corporate exposure** (limits, outstanding, undrawn)?
2. How concentrated is the portfolio in the **top 20 corporate groups**?
3. What is the exposure by **sector** and **country**, and where are the biggest concentrations?
4. How is exposure distributed by **internal rating band**?
5. Which sectors / countries are closest to their **limits**?

---

## Approach

1. **Exploratory analysis (01_eda_exposure.ipynb)**  
   - Clean and inspect the exposure snapshot.  
   - Compute key KPIs:
     - Total limits and outstanding exposure.
     - Top 20 groups and their share of the portfolio.
     - Exposure by sector, country, and rating_band.

2. **Concentration analysis (02_concentration_analysis.ipynb)**  
   - Portfolio concentration metrics (e.g. share of top N obligors).  
   - Exposure vs limits from `corp_limits.csv` (headroom, breach flags).  
   - Simple rating distribution and sector/country cross-tabs.

3. **Dashboard prep (03_dashboard_prep.ipynb)**  
   - Create aggregated tables for a Power BI / Tableau dashboard:
     - Top 20 groups table.
     - Exposure by sector / country / rating_band.
     - Exposure vs limit for selected sectors/countries.

4. **Dashboard (Power BI / Tableau)**  
   - Design a **“Corporate Exposure Overview”** dashboard with:
     - KPI cards (Total Exposure, # Groups, % in Top 20, etc.).
     - Bar charts for sector and country concentrations.
     - Matrix or table for group-level exposures and headroom.

---

## Outputs

- **Datasets**
  - `data/corp_exposure_snapshot.csv` – synthetic corporate exposure snapshot.
  - `data/corp_limits.csv` – example limits for single-name / sector / country.

- **Notebooks**
  - `notebooks/00_generate_corp_exposure_data.ipynb` – (optional) data generator.
  - `notebooks/01_eda_exposure.ipynb` – exploratory portfolio & concentration analysis.
  - `notebooks/02_concentration_analysis.ipynb` – deeper cuts and limit view.
  - `notebooks/03_dashboard_prep.ipynb` – tables ready for BI dashboards.

- **SQL**
  - `sql/corp_exposure_queries.sql` – example queries to compute exposure and concentration KPIs.

- **Report**
  - `reports/project1_exposure_concentration_summary.md` – business summary of key findings.

All data is **synthetic and generated in Python**.  
No real bank, customer, or exposure data is used.
