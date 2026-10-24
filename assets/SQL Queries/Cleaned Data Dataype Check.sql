select 
	column_name,
    data_type
FROM
	INFORMATION_SCHEMA.COLUMNS
where
	Table_Name = 'view_cleaned_jumia_phones'