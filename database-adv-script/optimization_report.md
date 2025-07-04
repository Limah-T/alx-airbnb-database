Write an initial query that retrieves all bookings along with the user details, property details, and payment details
"WHERE", "AND"

SELECT u.user_id, u.first_name, u.last_name, p.name, p.location, pay.amount, pay.method
FROM user AS u
INNER JOIN property AS p, payment AS pay 
ON u.user_id=p.user_id AND p.user_id=pay.booking_id.property_id;

SELECT * 
FROM booking
LEFT JOIN property, payment
ON u.user_id=p.user_id AND p.user_id=pay.booking_id.property_id;
[6:05 PM, 7/4/2025] Limah Temitope: Analyze the query’s performance using EXPLAIN and identify any inefficiencies.

Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.
[6:08 PM, 7/4/2025] Limah Temitope: EXPLAIN SELECT ...

id   select_type    table   type    possible_keys   key rows    Extra
1    SIMPLE         booking  ALL   PRIMARY, user_id  NULL       1000
1    SIMPLE         user     eq_ref PRIMARY PRIMARY
1    Using where
1    SIMPLE         property eq_ref PRIMARY PRIMARY
1    Using where
1    SIMPLE         payment  refm   booking_id booking_id
1
Using where; Using index

🚩 Possible Inefficiencies
	•	booking table scan (type = ALL) is a full table scan → not optimal on large datasets.
	•	If booking.user_id, booking.property_id, or payment.booking_id are not indexed, it will slow down JOINs.
	•	If not all columns are needed, SELECTing * or too many fields may increase I/O.

⸻

✅ 2. Optimized Version (Refactored)

a. Add Indexes (if not already):

b. Optimize Query:

Only select what’s needed and reduce the JOINs if, for instance, payment info isn’t always necessary:

SELECT 
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location
FROM booking AS b
JOIN user AS u ON b.user_id = u.user_id
JOIN property AS p ON b.property_id = p.property_id;