{{
  config(
    materialized='table'
  )
}}

SELECT 
    id AS promo_code_type_id,
    name AS type,
    created_at,
    updated_at
FROM {{ source(‘raw’, ‘promo_code_types’) }}