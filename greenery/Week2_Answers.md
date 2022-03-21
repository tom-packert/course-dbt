  
# Week 2 answers to questions
## Part 1: Models
(1) What is our user repeat rate?

80% ≈ 0.79838709677419354839

``` sql
SELECT 
  1.0 * SUM(CASE WHEN num_orders_ever >= 2 THEN 1 ELSE 0 END) / SUM(CASE WHEN num_orders_ever >= 1 THEN 1 ELSE 0 END) AS 
  repeat_rate
FROM 
  dbt_tom_packert.dim_users
;
```

