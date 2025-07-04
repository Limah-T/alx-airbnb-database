/*Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause*/

SELECT user.user_id, user.name, COUNT(booking.user_id) 
FROM booking
INNER JOIN user ON booking.user_id=user.user_id
GROUP BY user_id user.name;

/*Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.*/
SELECT 
    property_id,
    COUNT(booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_row_number
FROM booking
GROUP BY property_id;

SELECT 
    property_id,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_rank
FROM booking
GROUP BY property_id;