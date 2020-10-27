-- Find the actor_id first_name, last_name and total_combined_film_length 
-- of Sci-Fi films for every actor.
-- That is the result should list the actor ids, names of all of the actors(even if an actor has not been in any Sci-Fi films) 
-- and the total length of Sci-Fi films they have been in.
-- Look at the category table to figure out how to filter data for Sci-Fi films.
-- Order your results by the actor_id in descending order.
-- Put query for Q3 here

-- Select all desired columns and cast sci_fi to lit 0 if it is null otherwise alias it and grab it
SELECT a.actor_id, a.first_name, a.last_name, CASE WHEN sci_fi.sum IS NULL THEN 0 ELSE sci_fi.sum END as total_combined_film_length FROM actor a

-- Join command to merge tables for filtering
LEFT JOIN (
    -- Grab avtor id and the sum of film lengths and alias that length as sum
    SELECT a.actor_id AS actor_id, SUM(f.length) AS sum FROM actor a
        -- Match on actor id
        INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
        -- Match on film id
        INNER JOIN film f ON fa.film_id = f.film_id
        -- Match film category on film id
        INNER JOIN film_category fc ON f.film_id = fc.film_id
        -- Match on category id
        INNER JOIN category c ON fc.category_id = c.category_id
    -- Filter records where name is sci-fi and group and sort them
    WHERE c.name = 'Sci-Fi'
    GROUP BY a.actor_id
    ORDER BY sum ASC)

-- Final alias and matching, then sort output
AS sci_fi ON a.actor_id = sci_fi.actor_id
ORDER BY a.actor_id DESC;
