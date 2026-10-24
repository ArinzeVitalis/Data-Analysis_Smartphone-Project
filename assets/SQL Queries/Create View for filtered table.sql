create view cleaned_jumia_phones as
select
    row_id,
    brand_name,
    phone_name,
    phone_price,
	phone_ROM,
    phone_RAM
FROM jumia_sales_staging
	where 
		brand_name is not null and brand_name != ''
		and phone_price is not null and phone_price !=''
        and phone_RAM is not null and phone_RAM !=''
		and phone_ROM is not null and phone_ROM !=''
order by row_id asc
;