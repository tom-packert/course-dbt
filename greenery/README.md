Week 1 Homework

Repo: https://github.com/tom-packert/course-dbt

Short Answers: https://github.com/tom-packert/course-dbt/Readme.md

Reviewers: @Stephanie Mott @Elisaveta Aleksieva 

Self Review Questions:
Part 2: Were you able to create schema.yml files with model names and descriptions? Yes
Part 2: Were you able to run your dbt models against the data warehouse? YYes
Part 3: Could you run the queries to answer key questions from the project instructions? Yes

Reflection: What was most challenging/surprising in completing this week’s project?
I got confused trying to get a copy of the raw data into my dbt_tom_packert schema, then I finally realized that we are supposed to read from the Public Raw schema
Reflection: Is there anywhere you are still stuck or confused? Or Is there a particular part of the project where you want focused feedback from your reviewers? Just the Source RAW above

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
  estimated_delivery_at::date - created_at::date as order_delivery_time 
from dbt_tom_packert.stg_orders
where status = 'delivered'
)
select avg(order_delivery_time) from order_delivered

2.9370629370629371

