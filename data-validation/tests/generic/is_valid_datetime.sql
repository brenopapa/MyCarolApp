{% test is_valid_datetime(model, column_name) %}

with validation as (

    select 
        SAFE.PARSE_DATE('%Y%m%d %H:%M:%S', {{ column_name }}) as {{ column_name }}
    from {{ model }}
    where {{ column_name }} is not null

),

validation_errors as (

  select true
  from validation
  where 
    {{ column_name }} is null
)

select *
from validation_errors

{% endtest %}