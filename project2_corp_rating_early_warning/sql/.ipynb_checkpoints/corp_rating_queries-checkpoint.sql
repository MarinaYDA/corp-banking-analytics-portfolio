-- Example: default rate by rating_band on latest snapshot

WITH last_snapshot AS (
    SELECT *
    FROM corp_rating_panel
    QUALIFY ROW_NUMBER() OVER (PARTITION BY obligor_id ORDER BY as_of_date DESC) = 1
)
SELECT
    rating_band,
    COUNT(*) AS obligors,
    SUM(is_default) AS defaults,
    AVG(is_default) AS default_rate
FROM last_snapshot
GROUP BY rating_band
ORDER BY default_rate DESC;
