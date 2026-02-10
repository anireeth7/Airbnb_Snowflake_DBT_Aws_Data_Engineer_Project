{{ 
  config(
    materialized = 'ephemeral',
  ) 
}}

with hosts AS (
  SELECT
    HOST_ID,
    HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    DATEADD(day, HOST_CREATED_AT, '2020-01-01') AS HOST_CREATED_AT
  FROM {{ ref('obt') }}
)

SELECT * FROM hosts
