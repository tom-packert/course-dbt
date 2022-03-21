{{
  config(
    materialized='table'
  )
}}

select
    o.order_id as order_id,
    o.promo_id as promo_id,
    o.user_id as user_id,
    o.created_at as created_at,
    o.order_cost as order_cost,
    o.shipping_cost as shipping_cost,
    o.order_total as order_total,
    o.tracking_id as tracking_id,
    o.shipping_service as shipping_service,
    o.estimated_delivery_at as estimated_delivery_at,
    o.delivered_at as delivered_at,
    o.status,
    date_part('day',o.delivered_at - o.created_at) as days_to_deliver,
    case when o.status = 'delivered' and o.delivered_at > o.estimated_delivery_at then true else false end as ontime_delivery,
    a.zipcode,
    a.state,
    a.country
from {{ ref('stg_orders') }} o
left join {{ ref('stg_addresses') }} a
  on o.address_id = a.address_id