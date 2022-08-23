use sakila;

# 1. Write a query to display for each store its store ID, city, and country.

select store_id, city, country  from store as s 
inner join (address as ad) using (address_id)
inner join (city as c) using (city_id)
inner join (country as co) using (country_id);

# 2. Write a query to display how much business, in dollars, each store brought in.
select store_id, sum(amount) from store as s
inner join (staff as st) using (store_id)
inner join (payment as p) using (staff_id)
group by store_id;

# 3. What is the average running time(length) of films by category?
select name, round(avg(length),2) from film as f
inner join (film_category as fc) using (film_id)
inner join (category as cat) using (category_id)
group by name;

# 4. Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
select name, round(avg(length),2) from film as f
inner join (film_category as fc) using (film_id)
inner join (category as cat) using (category_id)
group by name
order by round(avg(length),2) desc
limit 5;

# 5. Display the top 5 most frequently(number of times) rented movies in descending order.
select title from rental
inner join inventory as inv using (inventory_id)
inner join film as f using (film_id)
group by title
order by count(rental_id) desc
limit 5;


# 6. List the top five genres in gross revenue in descending order.
select name, sum(amount) from payment as pay
inner join rental as r using (rental_id)
inner join inventory as inv using (inventory_id)
inner join film_category as fc using (film_id)
inner join category as cat using (category_id)
group by name
order by sum(amount) desc
limit 5;


# 7. Is "Academy Dinosaur" available for rent from Store 1?
select * from film as f
inner join inventory as inv using (film_id)
inner join rental as r using (inventory_id)
where title = "ACADEMY DINOSAUR" and store_id=1
# It was returned, hence it is available for rent
order by rental_date desc;