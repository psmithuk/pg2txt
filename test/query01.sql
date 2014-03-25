-- query01.sql
-- sample data types (10 rows)
select
	s.x as col_integer,
	false::boolean as col_bool,
	0::numeric(10,2) as col_numeric,
	0.01::numeric(10,2) as col_numeric,
	(1.23 + s.x)::numeric(10,2) as col_numeric,
	('hello world ' || repeat('a',s.x) )::varchar(100) as col_string,
	date_trunc('s', ('2010-01-01 ' || s.x+1 || ':00:00')::timestamp) as col_datetime,
	'006012312312' || s.x as col_upc
from
	generate_Series(0,9) s(x);