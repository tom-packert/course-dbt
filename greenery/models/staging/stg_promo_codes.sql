{{
  config(
    materialized='table'
  )
}}

SELECT 
    pc.promo_code_id,
    pc.name,
    pc.discount,
    pc.created_at,
    pc.updated_at,
    pct.type
FROM {{ ref(‘base_promo_codes’) }} pc
JOIN {{ ref(‘base_promo_code_types’) }} pct
    ON pc.promo_code_type_id = pct.promo_code_type_id