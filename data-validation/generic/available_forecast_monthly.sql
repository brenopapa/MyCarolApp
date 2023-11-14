{% test available_forecast_monthly(model) %}

with validation as (
      select 
        distinct DATE(final_reference_date) AS final_reference_date
      from {{ model }}
      where upper(frequency) = 'M'
),

validation_errors as (
  select true
  from unnest(GENERATE_DATE_ARRAY(CURRENT_DATE(), DATE_ADD(CURRENT_DATE, INTERVAL 2 MONTH), INTERVAL 1 MONTH)) as prediction
  left join validation
    on DATE_TRUNC(prediction, MONTH) = DATE_TRUNC(final_reference_date, MONTH)
  where validation.final_reference_date is null
)

select *
from validation_errors

{% endtest %}