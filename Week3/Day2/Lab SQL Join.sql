use sakila;

# 1. Which actor has appeared in the most films?
select first_name, last_name, count(film_id) from actor join film_actor using (actor_id)
group by actor_id
order by count(film_id) desc
limit 1;

# 2. Most active customer (the customer that has rented the most number of films)
select first_name, last_name, count(rental_id) from rental join customer using (customer_id)
group by customer_id
order by count(rental_id) desc
limit 1;

# 3. List number of films per category.
select name, count(film_id) from category join film_category using (category_id)
group by name
order by name;

# 4. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff join address using (address_id);

# 5. Display the total amount rung up by each staff member in August of 2005.
select staff_id, sum(amount) from payment join staff using (staff_id)
where payment_date like "2005-08-%"
group by staff_id;

# 6. List each film and the number of actors who are listed for that film.

select title, count(actor_id) from film join film_actor using (film_id)
group by title
order by count(actor_id) desc
limit 10;


/* Using the tables payment and customer and the JOIN command, 
list the total paid by each customer. List the customers alphabetically by last name.*/
select first_name, last_name, sum(amount) from payment join customer using (customer_id)
group by customer_id
order by last_name
limit 10;

/* Optional: Which is the most rented film? 
The answer is Bucket Brotherhood
This query might require using more than one join statement. Give it a try.*/
