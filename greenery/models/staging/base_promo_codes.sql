{{
  config(
    materialized='table'
  )
}}

SELECT 
    id AS promo_code_id,
    name,
    discount,
    promo_code_type_id,
    created_at,
    updated_at
FROM {{ source(‘raw’, ‘promo_codes’) }}