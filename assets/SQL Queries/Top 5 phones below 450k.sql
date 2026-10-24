select *
FROM view_cleaned_jumia_phones
where 
	brand_name like '%Infinix%'
    and phone_ROM NOT like '%64GB%'
    and phone_ROM NOT like '%32GB%'
    and phone_RAM NOT like '%2GB%'
    and phone_RAM NOT like '%4GB%'
    and phone_RAM NOT like '%5GB%'
    and phone_RAM NOT like '%6GB%'
    and phone_price <= 450000
    order by phone_ROM DESC
limit 5
