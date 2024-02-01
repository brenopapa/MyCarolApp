{% test is_valid_customer(model) %}

with validation as (

    select true 
    from 
    {{ model }} m
    left join customer c on m.account_code = c.code 
    where c.code is null

),

validation_errors as (

  select * from validation
)

select *
from validation_errors

{% endtest %}