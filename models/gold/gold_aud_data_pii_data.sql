-- models/gold/gold_aud_pii_data.sql
-- PII Data

{{ config(
    materialized='table'
) }}

WITH silver AS (
    SELECT * FROM {{ref('silver_aud_data')}}
)


SELECT
    aud_id,
    first_name,
    last_name,
    email,
    phone_number,
    load_date
FROM silver