-- models/gold/gold_aud_non_pii_data.sql
-- NON PII Data

{{ config(
    materialized='table'
) }}

WITH silver AS (
    SELECT * FROM {{ref('silver_aud_data')}}
)


SELECT
    aud_id,
    age,
    location,
    dev_cat,
    video_cat,
    load_date
FROM silver