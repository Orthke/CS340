-- Find the film_title of all films which feature both KIRSTEN PALTROW and WARREN NOLTE
-- Order the results by film_title in descending order.

(SELECT f.title AS "film_title" FROM film f
    INNER JOIN film_actor fa1 ON f.film_id=fa1.film_id
    INNER JOIN actor act1 ON fa1.actor_id=act1.actor_id
    INNER JOIN film_actor fa ON f.film_id=fa.film_id
    INNER JOIN actor act ON fa.actor_id=act.actor_id
WHERE (act.first_name='WARREN' AND act.last_name='NOLTE')
    AND (act1.first_name='KIRSTEN' AND act1.last_name='PALTROW'))
ORDER BY f.title DESC