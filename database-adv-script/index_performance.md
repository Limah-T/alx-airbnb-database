/*Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).*/
User - user_id
Booking - property_id, user_id
Property - user_id

User Table
	•	user_id — used in JOINs and WHERE clauses (e.g., to fetch bookings booked by users)

Booking Table
	•	user_id — used to link a booking to a user (JOIN, WHERE)
	•	property_id — used to link a booking to a property (JOIN, WHERE)
	
Property Table
	•	user_id — used to associate properties with their hosts (JOIN with user table)