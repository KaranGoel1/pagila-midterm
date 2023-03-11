/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 *
 * Write a SQL query that lists the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 * 4) have never been rented by anyone with an 'F' in their address (at the street, city, or country level).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

SELECT DISTINCT film.title
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
INNER JOIN inventory ON inventory.film_id = film.film_id
INNER JOIN rental ON rental.inventory_id = inventory.inventory_id
INNER JOIN customer ON rental.customer_id = customer.customer_id
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON country.country_id = city.country_id
WHERE film.title NOT ILIKE ('%f%') AND 
    actor.first_name NOT ILIKE ('%f%') AND
    actor.last_name NOT ILIKE ('%f%') AND
    customer.first_name NOT ILIKE ('%f%') AND
    customer.last_name NOT ILIKE ('%f%') AND
    address.address NOT ILIKE ('%f%') AND
    city.city NOT ILIKE ('%f%') AND
    country.country NOT ILIKE ('%f%')
ORDER BY film.title ASC;
