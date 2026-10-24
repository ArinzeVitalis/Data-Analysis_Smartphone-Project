select
	row_number() over (order by brand_name)
    as SN, brand_name
from (
	select distinct brand_name
    from view_cleaned_jumia_phones
    where brand_name is not null
    )
as Distinct_Brands;
