# Project 2 – Corporate Rating Panel & Early-Warning Model (Summary)

This project simulates how a bank could use **internal ratings, financial ratios,
and behavioural indicators** to flag higher-risk corporate obligors.

The data is fully synthetic but structured to resemble a wholesale corporate
portfolio (obligors, groups, sectors, countries, rating paths over time).

## Key findings

- **Ratings behave as expected**
  - Most exposure sits in Investment Grade and Sub-IG bands, with a smaller
    Watchlist and Default tail.
  - Rating migration matrices show mostly stable ratings with some upgrades
    and downgrades, and a higher probability of moving into Default from the
    weakest buckets.

- **Default rates line up with bands**
  - Default rates increase monotonically from Investment_Grade → Sub_IG →
    Watchlist → Default when measured on the final snapshot per obligor.
  - This confirms that the synthetic rating scale behaves like a realistic
    internal rating system.

- **Early-warning features are intuitive**
  - Defaulted obligors tend to have:
    - higher leverage (debt/EBITDA),
    - lower interest coverage,
    - higher days past due,
    compared with non-defaulted names.
  - These patterns are visible both by rating band and by default vs
    non-default groups.

- **Baseline models can separate risk**
  - Simple Logistic Regression, Random Forest, and Gradient Boosting models
    (with a shared preprocessing pipeline) can achieve very strong ROC-AUC on
    this synthetic dataset because the target is constructed from a clear
    signal (ratings + covenants + noise).
  - Random Forest feature importances highlight:
    - internal rating and rating_band dummies,
    - leverage, interest_coverage, days_past_due,
    as the main drivers—consistent with credit-risk intuition.

## How this relates to my real experience

In my **actual banking roles**, my work with large corporates focused on:

- querying and cleaning data with **SQL**,
- building exposure and limit views in **Excel**,
- and supporting risk and portfolio teams with descriptive analysis.

This project takes that corporate context and extends it with **Python-based
EDA and baseline modeling** on synthetic data to show how I would approach an
early-warning use case today in a modern analytics stack.
