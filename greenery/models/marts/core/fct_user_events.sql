{{
  config(
    materialized='table'
  )
}}

select
  e.user_id as user_id,
  Count(1) as number_of_events
from {{ ref('stg_events') }} e
left join {{ ref('stg_users') }} u
  on e.user_id = u.user_id
group by 1