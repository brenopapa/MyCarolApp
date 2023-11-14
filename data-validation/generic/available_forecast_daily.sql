{% test available_forecast_daily(model) %}

with validation as (
      select 
        distinct DATE(final_reference_date) AS final_reference_date
      from {{ model }}
      where upper(frequency) = 'D'
),

validation_errors as (
  select true
  from unnest(GENERATE_DATE_ARRAY(CURRENT_DATE(), DATE_ADD(CURRENT_DATE, INTERVAL 6 DAY), INTERVAL 1 DAY)) as prediction
  left join validation
    on prediction = final_reference_date
  where validation.final_reference_date is null
)

select *
from validation_errors


{% endtest %}