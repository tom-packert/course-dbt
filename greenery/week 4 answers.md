# Week 4 Answers
Post the link to your github repo in this channel. Add a readme file in your repo for short-answer questions
tag your code review partners (we just revealed pairings in your pod channel)

## answer the following self assessment questions
## Part 1: Were you able to add snapshots against the orders data? Did you see any data change? Yes - I was expecting to see the snapshots schema in my DBT db and finally realized I needed to scroll down to see the new schema.
```
gitpod /workspace/course-dbt/greenery $ dbt snapshot
18:23:55  Running with dbt=1.0.2
18:23:55  Found 22 models, 38 tests, 1 snapshot, 0 analyses, 576 macros, 0 operations, 0 seed files, 7 sources, 0 exposures, 0 metrics
18:23:55  
18:23:55  Concurrency: 4 threads (target='dev')
18:23:55  
18:23:55  1 of 1 START snapshot snapshots.order_snapshot.................................. [RUN]
18:23:55  1 of 1 OK snapshotted snapshots.order_snapshot.................................. [SELECT 361 in 0.14s]
18:23:55  
18:23:55  Finished running 1 snapshot in 0.40s.
18:23:55  
18:23:55  Completed successfully
18:23:55  
18:23:55  Done. PASS=1 WARN=0 ERROR=0 SKIP=0 TOTAL=1
gitpod /workspace/course-dbt/greenery $ 
```
Added a snapshop on Orders, modified the delivery_update.sql to fire changes and see the effects on the rows in the snapshot

## Part 2: Were you able to answer the product funnel questions? Yes
```
select 
  round((sum(level_page_view)*1.0) / count(session_id),3) as total_sessions,
  round((sum(level_add_to_cart)*1.0) / count(session_id),3) as cart_sessions,
  round((sum(level_checkout)*1.0) / count(session_id),3) as checkout_sessions
from dbt_tom_packert.fct_funnel_sessions
```
Total Sessions: 1
Cart Sessions: .808
Check Out sessions: .625

## Part 2: Were you able to create an exposure on your product analytics model? 
Yes

## Part 3: Reflection questions -- please answer 3A or 3B, or both!

### if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?

We already use DBT for about two years, I shose DBT after readon a lot of Tristan Handy's blog posts. It has improved quite a bit since our initial install.  I need to upgrade our production environment to the 1.0 version.

### if your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?

Make more use of Macros and Jinja
create more int and fact tables and less reliance on staging tables

### if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?

Changing my thinking about data modeling of making the data models easier to query and less about fancy SQL jumpingjacks

## 3B. Setting up for production / scheduled 

I already have DBT installed on mmy workstation (Windows) and want to setup DBT on my home Mac to work locally.  I am wondering about containerizing DBT like gitpod.io does to get the benefit of containers for managing projects with different versions.