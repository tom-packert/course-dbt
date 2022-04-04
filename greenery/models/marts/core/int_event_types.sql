{{
  config(
    materialized='view'
  )
}}

with stg_events as (
    select * from {{ ref( 'stg_events') }}
)

select 
    e.event_id,
    {{ one_hot_encode('event_type', 'stg_events', 'e') }},
    e.session_id,
    e.product_id
from stg_events e