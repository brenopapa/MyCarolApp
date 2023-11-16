{% test is_valid_device(model, column_name) %}

with validation as (

    select true 
    from 
    clockinrecords c
    left join device d on d.devicecode = c.devicecode 
    where e.devicecode is null

),

validation_errors as (

  select * from validation
)

select *
from validation_errors

{% endtest %}