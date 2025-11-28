-- ------------------------------------------------------------------
-- Corporate exposure & concentration – example SQL queries
-- Synthetic portfolio for large corporate obligors
-- ------------------------------------------------------------------

-- 1. Portfolio-level KPIs
--    Total limits, outstanding, undrawn and utilisation

SELECT
    SUM(limit_amount)            AS total_limit,
    SUM(outstanding_amount)      AS total_outstanding,
    SUM(undrawn_amount)          AS total_undrawn,
    SUM(outstanding_amount) / NULLIF(SUM(limit_amount), 0) AS utilisation
FROM corp_exposure_snapshot;


-- 2. Top 20 corporate groups by outstanding exposure
--    One row per group_name with exposure, share of portfolio and rank

WITH group_exposure AS (
    SELECT
        group_id,
        group_name,
        SUM(outstanding_amount) AS outstanding_amount
    FROM corp_exposure_snapshot
    GROUP BY group_id, group_name
),
totals AS (
    SELECT SUM(outstanding_amount) AS total_outstanding
    FROM group_exposure
)
SELECT
    g.group_id,
    g.group_name,
    g.outstanding_amount,
    g.outstanding_amount / t.total_outstanding AS share_of_portfolio,
    ROW_NUMBER() OVER (ORDER BY g.outstanding_amount DESC) AS exposure_rank
FROM group_exposure g
CROSS JOIN totals t
ORDER BY exposure_rank
FETCH FIRST 20 ROWS ONLY;


-- 3. Sector exposure and share of portfolio

WITH sector_exposure AS (
    SELECT
        sector,
        SUM(outstanding_amount) AS outstanding_amount
    FROM corp_exposure_snapshot
    GROUP BY sector
),
totals AS (
    SELECT SUM(outstanding_amount) AS total_outstanding
    FROM sector_exposure
)
SELECT
    s.sector,
    s.outstanding_amount,
    s.outstanding_amount / t.total_outstanding AS share_of_portfolio
FROM sector_exposure s
CROSS JOIN totals t
ORDER BY s.outstanding_amount DESC;


-- 4. Country exposure and share of portfolio

WITH country_exposure AS (
    SELECT
        country,
        SUM(outstanding_amount) AS outstanding_amount
    FROM corp_exposure_snapshot
    GROUP BY country
),
totals AS (
    SELECT SUM(outstanding_amount) AS total_outstanding
    FROM country_exposure
)
SELECT
    c.country,
    c.outstanding_amount,
    c.outstanding_amount / t.total_outstanding AS share_of_portfolio
FROM country_exposure c
CROSS JOIN totals t
ORDER BY c.outstanding_amount DESC;


-- 5. Exposure by rating band (Investment_Grade, Sub_IG, Watchlist)

WITH rating_exposure AS (
    SELECT
        rating_band,
        SUM(outstanding_amount) AS outstanding_amount
    FROM corp_exposure_snapshot
    GROUP BY rating_band
),
totals AS (
    SELECT SUM(outstanding_amount) AS total_outstanding
    FROM rating_exposure
)
SELECT
    r.rating_band,
    r.outstanding_amount,
    r.outstanding_amount / t.total_outstanding AS share_of_portfolio
FROM rating_exposure r
CROSS JOIN totals t
ORDER BY r.outstanding_amount DESC;


-- 6. Single-name exposure vs limit (for Top 20 groups)
--    Join exposure table to corp_limits on group_name

WITH group_exposure AS (
    SELECT
        group_name,
        SUM(outstanding_amount) AS outstanding_amount
    FROM corp_exposure_snapshot
    GROUP BY group_name
),
ranked AS (
    SELECT
        group_name,
        outstanding_amount,
        ROW_NUMBER() OVER (ORDER BY outstanding_amount DESC) AS exposure_rank
    FROM group_exposure
)
SELECT
    r.group_name,
    r.outstanding_amount,
    l.limit_amount        AS single_name_limit,
    r.outstanding_amount / NULLIF(l.limit_amount, 0) AS utilisation_vs_limit
FROM ranked r
LEFT JOIN corp_limits l
    ON l.limit_type = 'SingleName'
   AND l.dimension_value = r.group_name
WHERE r.exposure_rank <= 20
ORDER BY r.exposure_rank;


-- 7. Sector exposure vs sector limits

WITH sector_exposure AS (
    SELECT
        sector,
        SUM(outstanding_amount) AS outstanding_amount
    FROM corp_exposure_snapshot
    GROUP BY sector
)
SELECT
    s.sector,
    s.outstanding_amount,
    l.limit_amount       AS sector_limit,
    s.outstanding_amount / NULLIF(l.limit_amount, 0) AS utilisation_vs_limit,
    l.warning_threshold_pct
FROM sector_exposure s
LEFT JOIN corp_limits l
    ON l.limit_type = 'Sector'
   AND l.dimension_value = s.sector
ORDER BY s.outstanding_amount DESC;
