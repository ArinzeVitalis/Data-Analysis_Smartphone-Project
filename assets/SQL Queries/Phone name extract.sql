UPDATE jumia_sales_staging
SET phone_name = SUBSTRING_INDEX(phone_name_details, ' ', 5)
;