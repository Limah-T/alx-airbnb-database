/*Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.*/
SELECT * 
FROM booking
INNER JOIN user ON booking.user_id=user.user_id;


/*Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.*/
SELECT * 
FROM property 
LEFT JOIN review ON property.property_id=review.property_id 
ORDER BY properties.name;

/*Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.*/
SELECT *
FROM user
FULL OUTER JOIN booking ON user.user_id=booking.user_id;

