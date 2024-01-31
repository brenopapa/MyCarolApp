{% test is_valid_employee(model, column_name) %}

with validation as (

    select true 
    from 
    clockinrecords c
    left join employee e on e.mdmpersonid = c.mdmpersonid 
    where e.mdmpersonid is null

),

validation_errors as (

  select * from validation
)

select *
from validation_errors

{% endtest %}