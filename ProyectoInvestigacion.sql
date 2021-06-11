select * from pfizer;

alter table pfizer 
change column `Events reported` events_reported int(11);

alter table pfizer 
change column `Sex Code` sex_code text;

alter table pfizer 
change column `Age Code` age_code text;

select sum(events_reported) from pfizer;

drop view if exists funcion_distribucion_conjunta_pfizer;
create view funcion_distribucion_conjunta_pfizer as
select Symptoms, sex, sex_code, age, age_code, events_reported, cast(events_reported/328965 as decimal(50,7)) as probabilidad from pfizer;
-- select Symptoms, sex, sex_code, age, age_code, events_reported, (events_reported/328965) as probabilidad from pfizer;

select * from funcion_distribucion_conjunta_pfizer;

select probabilidad from funcion_distribucion_conjunta_pfizer 
where Symptoms = "fatigue" and sex_code = "F" and age_code = "30-39";

select * from funcion_distribucion_conjunta_pfizer where Symptoms = "laziness";

select * from funcion_distribucion_conjunta_pfizer where sex_code = "F" and age_code = "40-49" order by probabilidad desc limit 5;

select count(distinct Symptoms) from funcion_distribucion_conjunta_pfizer;
select distinct Symptoms from funcion_distribucion_conjunta_pfizer;