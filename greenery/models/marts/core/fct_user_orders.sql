{{
  config(
    materialized='table'
  )
}}

select
  o.user_id as user_id,
  count(o.user_id) as order_count,
  sum(o.order_total) as lifetime_value
from {{ ref('stg_orders') }} o
left join {{ ref('stg_users') }} u
  on o.user_id = u.user_id
group by 1