# Heading level 1
Short Answers - run in simple browser

1 - How many customers do we have
select count(1) from dbt.dbt_tom_packert.stg_users = 130

2 - On average, how many orders do we receive per hour?

with ordered_time as (
select 
  date_trunc('hour',  created_at) as date_hour,
  count(1) as order_count
from dbt_tom_packert.stg_orders 
group by 1 
)
select avg(order_count)
from ordered_time = 7.5208333333333333

3 - On average, how long does an order take from being placed to being delivered?

with order_delivered as (
select 
  order_id,
  delivered_at::date - created_at::date as order_delivery_time 
from dbt_tom_packert.stg_orders
where status = 'delivered'
)
select avg(order_delivery_time) from order_delivered

3.8918032786885246

4 - How many users have only made one purchase? Two purchases? Three+ purchases?

with user_orders as (
select 
  user_id,
  count(1) as orders_count 
from dbt_tom_packert.stg_orders 
group by 1
)
select 
  case 
    when orders_count = 1 then '1'
    when orders_count = 2 then '2'
    when orders_count >= 3 then '3+'
    end as user_order_count, 
   count(1)
from user_orders 
group by 1 
order by 1 asc

1 25
2 28
3+ 71

5 - On average, how many unique sessions do we have per hour?

with session_hour as (
select 
  date_trunc('hour',  created_at) as date_hour,
  count(1) as num_sessions
from dbt_tom_packert.stg_events
group by 1 
)
select avg(num_sessions) from session_hour
cd gren 
61.2586206896551724