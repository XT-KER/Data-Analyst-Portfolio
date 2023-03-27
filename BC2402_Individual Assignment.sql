#Question1
select date, total_vaccinations from country_vaccinations
where country = "Singapore";

#Question2 
select vaccines, sum(daily_vaccinations) as total_administrated from country_vaccinations
where country in ("Brunei", "Myanmar", "Cambodia", "Indonesia", "Laos", "Malaysia", "Philippines", "Singapore", "Thailand", "Vietnam", "Timor")
group by vaccines;

#Question3
select country, max(daily_vaccinations_per_million) from country_vaccinations
group by country
order by max(daily_vaccinations_per_million) desc;

#Question4
select vaccine, sum(total_vaccinations) as total_administrated from country_vaccinations_by_manufacturer
group by vaccine
order by total_administrated desc;

#Question5
create view vaccine_date (vaccine, date)
as select vaccine, min(date) as date from country_vaccinations_by_manufacturer
where location = "Italy"
group by vaccine;

select datediff(max(date),min(date)) as Difference_In_Days
from vaccine_date;

#Question6
select location, vaccine from country_vaccinations_by_manufacturer
where location = (
	select location
	from(select location, count(distinct(vaccine)) as c from country_vaccinations_by_manufacturer
	group by location order by c desc) as t2 limit 1)
group by vaccine;

#Question7
select country, vaccines, max(people_fully_vaccinated_per_hundred) as vaccinated_percentage from country_vaccinations
where people_fully_vaccinated_per_hundred > 60
group by country order by vaccinated_percentage desc;

#Question8
select left(monthname(date),3) as month, vaccine, max(total_vaccinations) as monthly_total_vaccin from country_vaccinations_by_manufacturer
where location = "United States"
group by month, vaccine;

#Question9 Date differ from 4th row
create view Date50 (country, date50, percentage)
as select country, str_to_date(date,'%m/%d/%Y'), total_vaccinations_per_hundred
from country_vaccinations
where total_vaccinations_per_hundred > 50
group by country;

create view MinDate (country, mindate)
as select country, min(str_to_date(date,'%m/%d/%Y')) from country_vaccinations
where country in 
(select country from date50)
group by country;

create view final_date50 as select * from date50
natural join mindate;

select country, Datediff(date50, mindate)+1 as Days_to_over_50 
from final_date50;

#Question10
select vaccine, sum(tv) as global_total
from (select location, vaccine, max(total_vaccinations) as tv from country_vaccinations_by_manufacturer
group by location, vaccine) as t3
group by vaccine
order by global_total desc;