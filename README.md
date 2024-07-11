# DBT Project: Test Local Setup

## Project Overview

This dbt project ingests a CSV file and processes it through a bronze and silver table structure.

## Steps

1. *Ingest the File*: The CSV file is ingested into a bronze table with a direct copy.
2. *Transform Data*: The data from the bronze table is transformed into a silver table, which includes deduplication and the addition of a load_date field.
3. *Testing*: Standard tests are added to ensure the integrity of the bronze and silver tables.

## Ingestion

The CSV file is ingested into the bronze table using the following model:

```sql
{{ config(
    materialized='table'
) }}

SELECT *
FROM {{ ref('aud_data20240702_143839') }}

