

-- Variables utiles 
select current_timestamp
select current_date
select now()


-- Create table default
created_at timestamp DEFAULT current_timestamp,
date  DATE NOT NULL DEFAULT CURRENT_DATE,
jour int not NULL DEFAULT extract(DAY from current_date),
semaine int not NULL DEFAULT extract(WEEK from current_date),
mois int not NULL DEFAULT extract(MONTH from current_date),
annee int not NULL DEFAULT extract(YEAR from current_date),


annee int4 NULL DEFAULT date_part('year'::text, CURRENT_DATE),


alter table rn_ms.observations add column annee int NULL DEFAULT extract(YEAR from current_date)

