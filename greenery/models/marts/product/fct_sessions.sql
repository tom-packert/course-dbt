with events as (
    select 
         *
    from {{ ref('stg_events') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),
event_productid as (
    select 
        e.event_id,
        e.session_id,
        e.user_id,
        e.page_url,
        e.created_at,
        e.order_id,
        e.event_type,
        coalesce(e.product_id, oi.product_id) as product_id
    from events e
    left outer join order_items oi on e.order_id = oi.order_id
),

event_product_names as (
    select ep.*,
        p.product_name
    from event_productid as ep
    left outer join products p on ep.product_id = p.product_id
)

select * from event_product_names