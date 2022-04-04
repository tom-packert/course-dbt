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
Added a snapshop on Orders

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

## Part 2: Were you able to create an exposure on your product analytics model? Yes

Part 3: Add your answer to “Reflection question” 3A if answering (if answering 3B instead, mark N/A)

Reflection: What was most challenging/surprising in completing this week’s project?
Reflection: Is there anywhere you are still stuck or confused? I copied/pasted the exposures example from the DBT documentation and there were hidden characters in the text that prevented generating docs, had to delete everything and type in clean

Reflection: What are you most proud of across the 4 weeks?
When your partners post their projects, please review it by answering the following questions via a threaded reply on their Slack post (due EOD Monday)

What are 1 or 2 things they did well in the project?

What are 1 or 2 concrete ways they could improve their work?

If they indicated that they were stuck and/or want focused feedback please provide responses if you can...
Any additional thoughts? Feel free to add words of encouragement as well!