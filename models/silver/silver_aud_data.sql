{{ config(
    materialized='table'
) }}

WITH deduped AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY aud_id ORDER BY aud_id DESC) as row_num
    FROM {{ ref('bronze_aud_data') }}
)

SELECT
    aud_id,
    age,
    location,
    dev_cat,
    video_cat,
    NOW()::timestamp as load_date
FROM deduped
WHERE row_num = 1

