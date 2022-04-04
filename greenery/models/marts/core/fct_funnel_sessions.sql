{{
  config(
    materialized='view'
  )
}}

with fct_sessions_events as (
    select * from {{ ref( 'fct_sessions_events') }}
)

select 
    session_id,
    case when 
        has_page_view > 0 or 
        has_add_to_cart > 0 or 
        has_checkout > 0 
    then 1 else 0 end as level_page_view,
    case when 
        has_add_to_cart > 0 or 
        has_checkout > 0 
    then 1 else 0 end as level_add_to_cart,
    case when 
        has_checkout > 0 
    then 1 else 0 end as level_checkout
from fct_sessions_events