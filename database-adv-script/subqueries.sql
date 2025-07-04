/*Write a query to find all properties where the average rating is greater than 4.0 using a subquery.*/
SELECT * 
FROM property 
WHERE(
        SELECT AVG(review.rating) 
        FROM review 
        WHERE property.property_id=review.property_id      
    ) > 4.0;

/*Write a correlated subquery to find users who have made more than 3 bookings.*/
SELECT * 
FROM user
WHERE (
    SELECT COUNT(*)
    FROM booking
    WHERE booking.user_id=user.user_id
    ) > 3;