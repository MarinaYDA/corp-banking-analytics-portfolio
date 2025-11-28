# Project 1 – Corporate Exposure & Concentration Summary

## 1. Context and objective

This project simulates a wholesale / corporate banking portfolio of large
corporate obligors. Each row in the dataset represents a facility
(loan, revolver, guarantee, etc.) with limit, outstanding, and undrawn
amounts, along with sector, country, and internal rating information.

The objective is to build a simple but realistic **exposure and concentration
dashboard** and supporting analysis that could be used by a risk or portfolio
management team.

---

## 2. Portfolio overview

- Total committed limits are roughly **$570m**, with **~$340m** currently
  outstanding and **~$230m** undrawn.
- Portfolio utilisation is around **60%**, leaving meaningful headroom on
  existing facilities.
- The exposure snapshot is spread across multiple corporate groups, sectors,
  and countries (no retail clients).

---

## 3. Single-name concentration

- The largest individual corporate group accounts for just over **5%** of total
  outstanding exposure.
- The **Top 10** groups together make up roughly **30–35%** of the portfolio;
  the **Top 20** around **50%**.
- This reflects a **moderately concentrated corporate book**: there is no
  single dominant name, but a relatively small set of large groups drives a
  significant share of exposure.

From a risk management perspective, these names are the natural focus for
limit setting, stress testing, and relationship monitoring.

---

## 4. Sector and country concentration

**Sector**

- Exposure is dominated by three sectors:
  - **Manufacturing**
  - **TMT (Technology, Media, Telecom)**
  - **Retail**
- Together, these sectors represent close to **60%** of total outstanding
  exposure, with the remainder in Real Estate, Transport, Utilities, and Energy.
- This tilt toward cyclical sectors (Manufacturing / Retail / TMT) is typical
  for a corporate portfolio but also concentrates risk in a few parts of the
  economy.

**Country**

- The largest country books are **Japan**, **China**, and **Brazil**, followed
  by several European and North American markets.
- No single country exceeds **~25%** of the book, but there is a clear **Asia
  tilt** when combining the top Asian markets.

For a real bank, these results would directly inform **country and sector
limit frameworks** and stress-test design.

---

## 5. Rating distribution

- The portfolio is primarily **Investment Grade**, with roughly **60–65%** of
  exposure in the Investment_Grade band.
- About **25–30%** sits in **Sub-IG** names, and **10–15%** is on the
  **Watchlist**.
- This mix is broadly consistent with a wholesale portfolio that balances
  investment-grade relationship lending with some higher-yield, higher-risk
  exposure.

In a real environment, the Sub-IG and Watchlist tails would be the main
drivers of expected loss, economic capital, and provisioning.

---

## 6. Dashboard and practical use

The Power BI dashboard provides a one-page view of:

- Core KPIs (limits, outstanding, undrawn, utilisation).
- Exposure breakdowns by **sector**, **country**, and **rating band**.
- A **Top 20 groups** table showing exposure, portfolio share, and headroom
  vs single-name limits.

In practice, this type of dashboard can be used in:

- **Monthly portfolio reviews** with risk and business teams.
- **Limit committees**, to see how close key sectors, countries, and names are
  to their limits.
- **Scenario and stress-test discussions**, focusing on concentrated sectors
  and regions.

---

## 7. Next steps and extensions

If this were a live production setup, natural next steps would include:

- Adding **time series** (e.g., monthly snapshots) to analyse migrations and
  growth over time.
- Linking to **PD / LGD / expected loss models** and integrating capital /
  RWA metrics.
- Automating the end-to-end pipeline from the source systems to the dashboard
  via scheduled ETL.

For this portfolio project, the focus is on demonstrating the core building
blocks: **clean data**, **concentration analytics**, and a clear, bank-style
dashboard.
