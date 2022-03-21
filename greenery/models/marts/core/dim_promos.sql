{{
  config(
    materialized='table'
  )
}}

select
    p.promo_id as promo_id,
    p.discount as discount,
    p.status as status
from {{ ref('stg_promos') }} p