{{
  config(
    materialized='table'
  )
}}

SELECT 
    user_id AS user_id,
    first_name,
    last_name,
    email,
    phone_number,
    created_at,
    updated_at,
    address_id
FROM {{ source('raw', 'users') }}
