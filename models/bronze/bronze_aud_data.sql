-- models/bronze/bronze_aud_data.sql

{{ config(
    materialized='table'
) }}

SELECT *
FROM {{ ref('aud_data20240715_164619') }}