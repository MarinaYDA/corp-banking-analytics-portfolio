## Project 1 – Corporate Exposure & Concentration Dashboard

**Goal:** Simulate a simple **exposure and concentration reporting pack** for
a wholesale / corporate lending book, monitoring risk by obligor, sector, and
country.

This project is **based on synthetic data** and is meant to show how I would
approach this problem today with Python, SQL, and Power BI. In my **real
banking role**, I worked with similar types of corporate exposure data in
**SQL and Excel** (extraction, cleaning, and reporting), but not with
Python-based pipelines or BI dashboards.

---

## Dataset

- `data/corp_exposure_snapshot.csv`  
  One row per **facility** (loan, revolver, guarantee, etc.) for a large
  corporate obligor.

  Key columns (subset):

  - `facility_id`, `obligor_id`, `group_id`, `obligor_name`, `group_name`
  - `country`, `region`, `sector`
  - `internal_rating` (e.g. 1–10) and `rating_band`
    (e.g. Investment_Grade, Sub_IG, Watchlist)
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

All data is **synthetic** and generated for this portfolio.

---

## Key Questions

1. What is the **total corporate exposure** (limits, outstanding, undrawn)?
2. How concentrated is the portfolio in the **top 20 corporate groups**?
3. What is the exposure by **sector** and **country**, and where are the biggest concentrations?
4. How is exposure distributed by **internal rating band**?
5. Which sectors / countries are closest to their **limits**?

---

## Approach

1. **Exploratory analysis (`01_eda_exposure.ipynb`)**  
   - Clean and inspect the exposure snapshot.  
   - Compute key KPIs:
     - Total limits and outstanding exposure.
     - Top 20 groups and their share of the portfolio.
     - Exposure by sector, country, and rating_band.

2. **Concentration analysis (`02_concentration_analysis.ipynb`)**  
   - Portfolio concentration metrics (e.g. share of top N obligors).  
   - Exposure vs limits from `corp_limits.csv` (headroom vs limit).  
   - Rating distribution and sector/country cross-tabs.

3. **Dashboard prep (`03_dashboard_prep.ipynb`)**  
   - Create aggregated tables for a Power BI / Tableau dashboard:
     - Top 20 groups table.
     - Exposure by sector / country / rating_band.
     - Exposure vs limit for selected sectors/countries.

4. **Dashboard (Power BI)**  
   - Design a **“Corporate Exposure Overview”** dashboard with:
     - KPI cards (total limits, outstanding, undrawn, utilisation).
     - Bar charts for sector and country concentrations.
     - A visual for rating-band distribution.
     - A table for group-level exposures, portfolio share, and headroom vs limits.

This reflects the type of exposure/limit views I saw in banking, but using a
modern, reproducible Python + Power BI workflow on synthetic data.

---

## Power BI Dashboard – Corporate Exposure Overview

**File:** `bi/corp_exposure_overview.pbix`  
**Screenshot:** `bi/corp_exposure_overview.png`  
**Data source:** aggregated CSVs from `data/dashboard/` generated in
`03_dashboard_prep.ipynb`.

The dashboard is designed to look like a simple internal risk/portfolio view
for a wholesale corporate loan book:

- **Top KPI cards** show total limits, outstanding exposure, undrawn amount, and
  overall utilisation for the portfolio.
- **Sector and country bar charts** highlight where exposure is concentrated by
  industry and geography.
- A **rating-band visual** shows the split between Investment Grade, Sub-IG, and
  Watchlist exposure.
- A **Top 20 corporate groups table** combines outstanding exposure, portfolio
  share, and (optionally) single-name limits and utilisation vs those limits.

All visuals are fed by small, version-controlled CSV tables created in the
Python notebooks, so the BI layer stays thin and the business logic is
reproducible.

---

## Outputs

- **Datasets**
  - `data/corp_exposure_snapshot.csv` – synthetic corporate exposure snapshot.
  - `data/corp_limits.csv` – example limits for single-name / sector / country.

- **Data (dashboard-ready CSVs)** – saved in `data/dashboard/` by
  `03_dashboard_prep.ipynb`:
  - `dashboard_kpis.csv` – total limit, total outstanding, total undrawn, utilisation.
  - `dashboard_top20_groups.csv` – Top 20 corporate groups with exposure,
    portfolio share, single-name limits, and utilisation vs those limits.
  - `dashboard_sector_exposure.csv` – outstanding exposure and share by sector
    (with sector limits if available).
  - `dashboard_country_exposure.csv` – outstanding exposure and share by country
    (with country limits if available).
  - `dashboard_rating_exposure.csv` – exposure and share by rating band
    (Investment Grade, Sub-IG, Watchlist).
  - `dashboard_exposure_long.csv` – optional long-format table with dimension_type
    (Sector / Country / Rating_Band) and dimension_value for flexible visuals.

- **Notebooks**
  - `notebooks/00_generate_corp_exposure_data.ipynb` – (optional) data generator.
  - `notebooks/01_eda_exposure.ipynb` – exploratory portfolio & concentration analysis.
  - `notebooks/02_concentration_analysis.ipynb` – deeper cuts and limit view.
  - `notebooks/03_dashboard_prep.ipynb` – tables ready for BI dashboards.

- **SQL**
  - `sql/corp_exposure_queries.sql` – example queries to compute exposure and concentration KPIs.

- **Report**
  - `reports/project1_exposure_concentration_summary.md` – business summary of key findings.

- **Power BI dashboard**
  - `bi/corp_exposure_overview.pbix` – “Corporate Exposure Overview” page with KPI cards,
    sector/country/rating visuals, and a Top 20 corporate groups table.
  - `bi/corp_exposure_overview.png` – screenshot of the main dashboard view for quick
    preview on GitHub/LinkedIn.

All data is **synthetic and generated in Python**.  
No real bank, customer, or exposure data is used.

In my real banking experience I focused on **SQL/Excel-based reporting and
analysis** on corporate portfolios; this project extends that experience into a
modern, fully reproducible Python + BI workflow.
