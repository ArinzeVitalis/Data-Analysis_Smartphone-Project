select
	row_number() over (order by brand_count desc)
    as 
		SN,
        brand_name,
        brand_count
from (
	select brand_name,
    count(*) as 
    brand_count
    from view_cleaned_jumia_phones
    where brand_name is not null
    group by brand_name
    )
as Distinct_Brands
limit 5
