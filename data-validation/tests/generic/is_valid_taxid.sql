{% test is_valid_taxid(model, column_name) %}

with validation as (

    select true 
    from 
    device d
    left join mdmcompany c on d.mdmtaxid = c.mdmtaxid 
    where c.mdmtaxid is null

),

validation_errors as (

  select * from validation
)

select *
from validation_errors

{% endtest %}