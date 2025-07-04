/*Write an initial query that retrieves all bookings along with the user details, property details, and payment details */

SELECT 
        b.booking_id,
        u.user_id, 
        u.first_name, 
        u.last_name, 
        p.name, 
        p.location, 
        pay.payment_id,
        pay.amount, 
        pay.method
FROM booking AS b
JOIN user AS u ON b.user_id=u.user_id 
JOIN property AS p ON b.property_id=p.booking_id
LEFT JOIN payment AS pay ON b.booking_id=pay.booking_id;
