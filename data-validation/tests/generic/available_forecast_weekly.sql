{% test available_forecast_weekly(model) %}

with validation as (
      select 
        distinct DATE(final_reference_date) AS final_reference_date
      from {{ model }}
      where upper(frequency) = 'W'
),

validation_errors as (
  select true
  from unnest(GENERATE_DATE_ARRAY(CURRENT_DATE(), DATE_ADD(CURRENT_DATE, INTERVAL 3 WEEK), INTERVAL 1 WEEK)) as prediction
  left join validation
    on DATE_TRUNC(prediction, WEEK) = DATE_TRUNC(final_reference_date, WEEK)
  where validation.final_reference_date is null
)

select *
from validation_errors

{% endtest %}