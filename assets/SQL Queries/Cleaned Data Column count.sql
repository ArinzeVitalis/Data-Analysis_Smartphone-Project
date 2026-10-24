select 
	count(*) as Column_count 
FROM
	INFORMATION_SCHEMA.COLUMNS
where
	Table_Name = 'view_cleaned_jumia_phones'