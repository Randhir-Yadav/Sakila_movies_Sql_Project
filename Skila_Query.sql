use sakila;

-- joins practice question
-- Q2.
select count(distinct category_id)from film_category;

-- Q3.

select * from city as c
left join country as co
on c.country_id = co.country_id
where co.country = "india";

-- select*from city
-- where country_id = 44

-- Q4
select ac.actor_id,f.title,concat(first_name," ",last_name) as actor_name from actor as ac
left join film_actor as fa
on ac.actor_id = fa.actor_id
left join film as f
on fa.film_id = f.film_id;


-- Q5.
select f.title,c.name from film as f
inner join film_category as fc
on f.film_id = fc.film_id
inner join category as c
on fc.category_id = c.category_id
order by title;

-- Q6.
select count(*) from film as f
left join film_category as fc
on f.film_id = fc.film_id
left join category as c
on fc.category_id = c.category_id
where c.name = "action";

-- Q7.
select*from film;
select*from film_actor;
select*from actor;


select concat(first_name," ",last_name) as actor_name , f.title,f.length from actor as a
left join film_actor as fa
on a.actor_id = fa.actor_id
left join film as f
on fa.film_id = f.film_id
where f.length>100;

-- Q8.
select*from actor;
select*from film_actor;
select*from film_category;
select*from category;

select concat(first_name," ",last_name) as actor_name,c.name  from actor  as a
left join film_actor as fa
on a.actor_id=fa.actor_id
left join film_category as fc
on fa.film_id=fc.film_id
left join category as c
on fc.category_id=c.category_id
where c.name in ("Animation" , "Children");

-- Q9.
select*from city;
select*from country;

select * from city as c
inner join country as co
on c.country_id=co.country_id
where  city like "b%" and co.country = "india";

-- Q10.
select*from customer;
select*from address;
select*from city;
select*from country;


select concat(first_name," ",last_name) as customer_name,co.country_id,co.country from customer as c
right join address as a
on c.address_id=a.address_id
left join city as ci
on a.city_id=ci.city_id
right join country as co
on ci.country_id=co.country_id
where concat(first_name," ",last_name) like "a%" and co.country="india";

-- Q11.
select*from customer;
select*from address;
select*from city;
select*from country;

select count( customer_id),c.first_name,co.country from customer as c
right join address as a
on c.address_id=a.address_id
left join city as ci
on a.city_id=ci.city_id
right join country as co
on ci.country_id=co.country_id
where co.country in("canada","france")
group by c.first_name,co.country;

-- Q12.
select*from inventory;
select*from staff;

select count(inventory_id) from inventory as i
inner join staff as s
on i.store_id=s.store_id
where s.staff_id=1;

-- Q13.
select*from customer;
select*from payment;

select*from customer as c
left join payment as p
on c.customer_id=p.customer_id
where p.amount>10;

-- Q13.
select*from customer;
select*from address;
select*from city;
select*from country;

select concat(first_name," ",last_name)as customer_name,co.country,co.country_id from customer as c
right join address as a
on c.address_id=a.address_id
left join city as ci
on a.city_id=ci.city_id
inner join country as co
on ci.country_id=co.country_id
where co.country="france";

-- Q14.
select*from city;
select*from country;

select city from city as c
inner join country as co
on c.country_id=co.country_id
where co.country = "india" and city like "a%";

-- Q15.
select*from customer;
select*from address;
select*from city;
select*from country;

select c.first_name, c.last_name, a.address , c.active,co.country from customer as c
right join address as a
on c.address_id=a.address_id
left join city as ci
on a.city_id=ci.city_id
left join country as co
on ci.country_id=co.country_id
where first_name like "a%" and co.country like "c%" and c.active=1;

-- Q16.
select*from film_text;
select*from inventory;

select distinct ft.title, ft.description from film_text as ft
inner join inventory as i
on ft.film_id=i.film_id
where i.store_id=2;

-- Q17.
select*from staff;
select*from store;
select*from address;


select concat(first_name," ",last_name)as manager_name,a.address,a.postal_code from staff as s
left join store as st
on s.staff_id=st.manager_staff_id
inner join address as a
on st.address_id=a.address_id;

-- Q17.
select*from inventory;
select*from film;

select i.inventory_id,i.store_id,f.title,f.rating,f.rental_rate,f.replacement_cost from inventory as i
left join film as f
on i.film_id=f.film_id;

-- Q18.
select*from customer;
select*from address;
select*from store;


select concat(c.first_name," ",c.last_name)as customer_name,c.active,a.address,c.customer_id from customer as c
left join address as a
on c.address_id=a.address_id;

-- Q19.
select*from address;
select*from city;
select*from country;

select count(a.address) from address as a
left join city as c
on a.city_id=c.city_id
inner join country as co
on c.country_id = co.country_id
where co.country="australia";

-- Q19.	
select*from film;
select*from inventory;
-- 1.least replacement cost
select f.title,f.replacement_cost from film as f
inner join inventory as i
on f.film_id=i.film_id
where i.store_id in(1,2) 
order by f.replacement_cost ASC
limit 1;

-- 2.Maximum replacement cost
select f.title,f.replacement_cost from film as f
inner join inventory as i
on f.film_id=i.film_id
where i.store_id in(1,2) 
order by f.replacement_cost desc
limit 1;

-- 3.Avg replacement cost
select avg(f.replacement_cost) from film as f
inner join inventory as i
on f.film_id=i.film_id
where i.store_id in(1,2) ;

-- Q 20.
select*from rental;
select*from customer;
select*from inventory;
select*from film;

select c.customer_id,f.title,r.rental_date  from rental as r
left join customer as c
on r.customer_id=c.customer_id
inner join inventory as i
on c.store_id=i.store_id
inner join film as f
on i.film_id=f.film_id
where c.customer_id=1;



-- subqueries
-- Q1.
select * from film;
select*from film_category;
select*from category;

SELECT 
    title
FROM
    film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            film_category
        WHERE
            category_id = (SELECT 
                    category_id
                FROM
                    category
                WHERE
                    name = 'Horror'));
 -- Q1. Solve by me when i was practicing the subquery questions                   
  select title from film as f
  where film_id in (select film_id from film_category as fc 
                where fc.category_id=(select category_id from category as c
                where fc.category_id=c.category_id and name="horror"));
                    
                    
-- Q 2 

SELECT*FROM CITY;
select*from country;

select city from city as c
where c.country_id in ( select co.country_id from country as co where co.country != "china" );

-- Q3
SELECT*FROM COUNTRY;
select*from city;

select city from city 
where country_id in(select country_id from country where country in("india","pakistan"));

-- Q4 
SELECT*FROM customer;
select*from payment;

select first_name , last_name from customer
where customer_id != all(select customer_id from payment where amount = 0);
-- Q4. self done using not in done
select*from customer;
select*from payment;

select first_name,last_name from customer as c
where c.customer_id not in  (select customer_id from payment as p
                        where amount=0);


-- corelated queries

-- Q1

select*from customer;
select*from rental;

select*from customer as c
where 30=(select count(*)from rental as r where r.customer_id=c.customer_id);

-- Q2.
select*from customer;
select*from payment;

select*from customer as c
where (select sum(p.amount) from payment as p
            where c.customer_id=p.customer_id
            ) between 100 and 150;
 -- other way of solution
 select*from customer as c
 where 100<=(select sum(p.amount) from payment as p
              where c.customer_id=p.customer_id
              ) and (
              select sum(p.amount) from payment as p
              where c.customer_id=p.customer_id
              )<=150;
            
-- Q3.
select*from customer;
select*from rental;

select*from customer as c
where exists(select 1 from rental as r
              where c.customer_id=r.customer_id
              and r.rental_date < "2005-06-01");

-- Q4.
select*from film;
select*from film_category;
select*from category;

select title from film as f
where exists(select 1  from film_category as fc , category as c
              where f.film_id=fc.film_id 
			  and fc.category_id=c.category_id
			and c.name="horror");
-- other approach of doing this question
select title from film as f
where exists(select 1 from film_category as fc
          inner join category as c
          on fc.category_id=c.category_id
          where fc.film_id=f.film_id
          and c.name="horror");
          
-- subquery questions
-- Q1.
select*from customer;
select*from rental;
select*from payment;

select customer_id,
(select count(*)  from rental as r
where r.customer_id=c.customer_id) as rental,
 (select sum(p.amount)  from rental as r
 left join payment as p
 on r.rental_id=p.rental_id
 where r.customer_id=c.customer_id) as total
 from customer as c
 order by c.customer_id;
                       
-- witout join this question
  select customer_id,
  (select count(*) from rental as r
   where r.customer_id=c.customer_id) as rental,
   (select sum(amount) from payment as p
   where p.rental_id in(select r.rental_id from rental as r
                        where r.customer_id=c.customer_id)) as total
                        from customer as c
                        order by c.customer_id;

-- Q2.
select*from film; 
select*from inventory;
select* from rental;

select f.title from film as f
where not exists(select 1 from rental as r,inventory as i
where r.inventory_id=i.inventory_id and  i.film_id=f.film_id);

-- Q3.
select*from rental;
select*from customer;

select distinct concat(c.first_name," ",c.last_name) as customer_name from customer as c
join rental as r
on c.customer_id=r.customer_id
inner join rental as r2
on r.inventory_id=r2.inventory_id
where r2.customer_id=20
and c.customer_id!=20;

-- solve by using subquery

select distinct concat(first_name," ",last_name) as customer_name from customer as c
where c.customer_id in(select r.customer_id from rental as r
                     where r.inventory_id in(select r2.inventory_id from rental as r2
                     where r2.customer_id=20 and c.customer_id!=20));

-- Q4.
select*from film;
select*from film_category;
select*from category;

select title from film as f
where f.film_id in(select fc.film_id from film_category as fc
				   where fc.category_id in(select c.category_id from category as c
                   where c.name="sports"));

-- Q5.
select*from city;
select*from country;

select city from city as c
where c.country_id in(select co.country_id from country as co
                      where co.country="sri lanka");

-- Q6.
select*from customer;
select*from rental;

select distinct concat(first_name," ",last_name) as customer_name from customer as c
where c.customer_id in(select r.customer_id from rental as r
                       where r.inventory_id in(select r2.inventory_id from rental as r2
                       where r2.customer_id=12
                       and c.customer_id!=12));
                       
-- Q7.
select*from film;
select*from film_category;
select*from category;

select f.title from film as f
where exists(select 1 from film_category as fc
              inner join category as c
              on fc.category_id=c.category_id
              where f.film_id=fc.film_id
              and c.name="sci-fi");
              


-- case expression

-- syntax
-- case
-- when condition 1 then result 1
-- when condotion 2 then result 2
-- else
-- end

select*from customer;

-- Q1
select first_name,last_name,
case 
when active=1 then "active"
else "inactive"
end as activity_type
from customer;


-- Q2
select*from customer;
select*from rental;

select c.first_name,c.last_name,
case
when active = 0 then 0
else (select count(*) from rental as r where c.customer_id=r.customer_id )
end as num_rental
from customer as c;

-- Q3.
select*from rental;
-- for showing data month wise without any conditio wheather it is n row or column

select monthname(rental_date)as month,count(*),year(rental_date) as year  from rental
group by month,year
having year=2005 and month in("may","june","july");

-- to show minth wise count in row we use this query
select
sum(case when monthname(rental_date) ="may"  then 1 else 0 end) as may,
sum(case when monthname(rental_date)="june" then 1 else 0 end) as june,
sum(case when monthname(rental_date)="july" then 1 else 0 end) as july
from rental 
where year(rental_date)=2005;

-- Q4.
select* from film;
select*from inventory;

select f.title,
case
when (select count(*) from inventory as i where f.film_id=i.film_id)=0 then "out of stock"
when (select count(*) from inventory as i where f.film_id=i.film_id)<2 then "scarce"
when (select count(*) from inventory as i where f.film_id=i.film_id)<4 then "available"
else "common"
end as categorized
from film as f;

-- Q5.
select*from customer;
select*from payment;

select c.first_name,c.last_name, count(p.amount) as count,sum(p.amount) as total,avg(p.amount) as avg from customer as c
left join payment as p
on c.customer_id=p.customer_id
group by c.first_name,c.last_name;

-- Q6.
select*from film;

select
sum(case when  rating= "g" then 1 else 0 end) as rating_g,
sum(case when rating="pg" then 1 else 0 end) as rating_pg,
sum(case when rating="nc17" then 1 else 0 end) as rating_nc17
from film;

-- Q7.
select*from film;

select
sum(case when rating="r" then 1 else 0 end) as rating_r,
sum(case when rating="pg-13" then 1 else 0 end) as rating_pg_13
from film;



 
 -- CTE QUERY COMMON TABLE EXPRESSION
 -- Q1. Give me the list of actors whose last name start with s and worked on in pg rated movies
 -- and give the revenue of those movies
 
select*from actor;
-- join with actor (actor_id)select*from film_actor
select*from film;
-- select *from inventory
-- select*from rental
select *from payment;

with actor_s as(
select first_name,last_name,actor_id from actor 
where last_name like "%s"),
actor_s_pg as(
select a.actor_id,f.film_id, concat(first_name," ",last_name) as name,rating from actor_s as a
inner join film_actor as fa
on a.actor_id=fa.actor_id
inner join film as f
on fa.film_id = f.film_id
where rating = "pg"),
actor_s_pg_revenue as(
select name,rating,sum(amount)as revenue from actor_s_pg as a
inner join inventory as i
on a.film_id=i.film_id
inner join rental as r
on i.inventory_id=r.inventory_id
inner join payment as p
on r.rental_id=p.rental_id
group by name,rating
)
select name,rating,revenue from actor_s_pg_revenue;

-- Q2. Write a query where the last name of the actors start with a and acted in nc-17 movie.show film_id and title?
select*from actor;
select*from film_actor;
select*from film;

with actor_s as(
select first_name,last_name,actor_id from actor as a
where last_name like "%a"),
actor_rating as(
select a.actor_id,concat(first_name," ",last_name) as name,rating,f.film_id,f.title from actor_s as a
inner join film_actor as fa
on a.actor_id=fa.actor_id
inner join film as f
on fa.film_id=f.film_id
where rating="nc-17"
group by name,f.title,rating,a.actor_id,f.film_id
)
select name,film_id,rating,title from actor_rating;

 
-- Recursive cte

with recursive even_no (n) as(
select 10
union
select n+2 from even_no
where n<20
)
select*from even_no;

-- odd 25 to 35

with recursive odd_no (n) as(
select 25
union
select n+2 from odd_no
where n<35
)
select*from odd_no;

-- Q3. find odd number between 10 to 30
with recursive odd_no (n) as(
select 11
union 
select n+2 from odd_no
where n<=30
)
select *from odd_no;

-- Q4. find even number betwee 20 to 40

with recursive even_no (n) as(
select 20
union all
select n+2 from even_no
where n<40
)
select *from even_no;


-- star pattern

with recursive stars as(
select cast("*"as char(10)) n
union all
select concat(n," ","*")from stars
where length(n)<5)
select n from stars order by length(n);

-- Q2.
with recursive star as(
select cast("*"as char(20)) n
union all
select concat(n," ","*") from star
where length(n)<7)
select n from star
order by length(n);

--  using recursive counting
with recursive count as(
select 1 as n
union
select n+1 from count
where n<3
)
select *from count;

-- window function
-- give me total amount,avg amount spent by each customer along with individual payments he made
select customer_id,amount,sum(amount) over (partition by customer_id),avg(amount)over (partition by customer_id) from payment;
-- percentage of amount
 select customer_id,amount*100/sum(amount) over (partition by customer_id) from payment 
