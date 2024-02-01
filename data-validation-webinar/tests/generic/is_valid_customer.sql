{% test is_valid_customer(model) %}

with validation as (

    select true 
    from 
    {{ model }} m
    left join {{ source('mycarolapp','customer') }} c on m.accountcode = c.code 
    where c.code is null

),

validation_errors as (

  select * from validation
)

select *
from validation_errors

{% endtest %}