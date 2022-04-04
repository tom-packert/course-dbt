{{
  config(
    materialized='view'
  )
}}

{%
set event_types = dbt_utils.get_column_values(
        table = ref('stg_events'), 
        column = 'event_type')
%}

with int_event_types as (
    select * from {{ ref('int_event_types') }}
),

fct_sessions as (
    select * from {{ ref('fct_sessions') }}
),

stg_products as (
    select * from {{ ref('stg_products') }}
),

product_session as (
    select distinct 
        session_id, 
        product_id
    from int_event_types
    where product_id is not null
)

select 
  s.session_id, 
  {% for event_type in event_types %}
    {{event_type}}_count,
  {% endfor %}
  ps.product_id,
  p.product_name,
  p.price
from fct_sessions s
join product_session ps on s.session_id = ps.session_id
join stg_products p on ps.product_id = p.product_id