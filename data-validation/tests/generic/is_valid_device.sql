{% test is_valid_device(model) %}

with validation as (

    select true 
    from 
    {{ model }} c
    left join device d on d.devicecode = c.devicecode 
    where e.devicecode is null

),

validation_errors as (

  select * from validation
)

select *
from validation_errors

{% endtest %}