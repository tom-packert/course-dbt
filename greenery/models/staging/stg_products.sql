{{
  config(
    materialized='table'
  )
}}

SELECT 
    product_id,
    name as product_name,
    price as price,
    inventory as inventory
FROM {{ source('raw', 'products') }}