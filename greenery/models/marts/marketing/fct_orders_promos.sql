{{
  config(
    materialized='table'
  )
}}

WITH
  fct_orders AS 
  (
  SELECT

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
    o.zipcode,
    o.state,
    o.country
  FROM
    {{ ref('fct_orders') }} o
  )
, stg_promos AS 
  (
  SELECT 
    promo_id,
   discount,
   status
  FROM {{ ref('stg_promos') }}
  )

SELECT 
 fct_orders.order_id,
 fct_orders.promo_id,
 fct_orders.user_id,
 fct_orders.created_at,
 fct_orders.order_cost,
 fct_orders.order_total,
 stg_promos.discount
FROM 
  fct_orders
LEFT JOIN 
  stg_promos USING (promo_id)