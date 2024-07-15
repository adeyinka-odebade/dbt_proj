{{ config(
    materialized='table'
) }}

WITH bronze_data AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY aud_id ORDER BY aud_id DESC) as row_num
    FROM {{ ref('bronze_aud_data') }}
)

SELECT
    aud_id,
    first_name,
    last_name,
    email,
    phone_number,
    age,
    location,
    dev_cat,
    video_cat,
    NOW()::timestamp as load_date
FROM bronze_data
WHERE row_num = 1

