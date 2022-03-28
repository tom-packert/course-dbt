with events as (
    select * from {{ ref('stg_events') }}
),

users as (
    select * from {{ ref('stg_users') }}
),

user_page_views as (
    select 
        e.user_id,
        e.page_url,
        e.event_type,
        u.first_name,
        u.last_name,
        u.phone_number,
        u.email,
        count(e.user_id) as number_of_views,
        min(e.created_at) as first_view_date,
        max(e.created_at) as last_view_date
    
    from events e
    left outer join users u
        on e.user_id = u.user_id
    where event_type = 'page_view'
    group by 1,2,3,4,5,6,7
    
),

final as (
    
    select 
        page_url,
        first_name,
        last_name,
        phone_number,
        email,
        number_of_views,
        first_view_date,
        last_view_date

    from user_page_views
)

select * from user_page_views