-- Find the actor_id, first_name and last_name of all actors who have never been in a Sci-Fi film.
-- Order by the actor_id in ascending order.
-- Put your query for Q4 here

-- Select needed columns and assign them to vars
SELECT a.actor_id, a.first_name, a.last_name FROM actor a

-- Perform joins to match the records on film actor, category, and film
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.actor_id = f.film_id
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id

-- We are looking for records where actors were not in scifi movies
WHERE a.actor_id NOT IN 
 
-- Grav actor id for joining
(SELECT a.actor_id FROM actor a
    -- Join on actor id
    INNER JOIN film_actor fa ON  a.actor_id = fa.actor_id
    -- Join on film id
    INNER JOIN film f ON fa.film_id = f.film_id
    -- Join category on id
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    -- Join on category id
    INNER JOIN category c ON fc.category_id = c.category_id
    -- Get only records with scifi and group them into categories
	WHERE c.name = 'Sci-Fi'
    GROUP BY a.actor_id)
    
-- Do a final group and sorting
GROUP BY a.actor_id
ORDER BY a.actor_id ASC




