/*Write SQL CREATE INDEX commands to create appropriate indexes for those columns*/

User - user_id
Booking - property_id, user_id
Property - user_id

/* Index for user table*/
CREATE INDEX idx_user_id ON user(user_id);

/* Index for booking table*/
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);

/* Index for property table*/
CREATE INDEX idx_property_user_id ON property(user_id);

/*Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.*/
EXPLAIN ANALYZE SELECT * 
    FROM booking
    INNER JOIN user ON booking.user_id=user.user_id;

EXPLAIN ANALYZE SELECT *
FROM user
WHERE (
    SELECT COUNT(*)
    FROM booking
    WHERE booking.user_id=user.user_id
    ) > 3;

EXPLAIN ANALYZE SELECT * 
FROM property 
WHERE(
        SELECT AVG(review.rating) 
        FROM review 
        WHERE property.property_id=review.property_id      
    ) > 4.0;
