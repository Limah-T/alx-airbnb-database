-- ========== Users ==========
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'Alice', 'Walker', 'alice@example.com', 'hash1', '1234567890', 'guest'),
  ('00000000-0000-0000-0000-000000000002', 'Bob', 'Smith', 'bob@example.com', 'hash2', '2345678901', 'host'),
  ('00000000-0000-0000-0000-000000000003', 'Carol', 'Lee', 'carol@example.com', 'hash3', '3456789012', 'admin');

-- ========== Properties ==========
INSERT INTO Property (property_id, user_id, name, description, location, pricepernight)
VALUES
  ('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Modern Loft', 'A modern loft in downtown LA.', 'Los Angeles, CA', 150.00),
  ('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 'Beach House', 'Cozy beach house with ocean views.', 'Santa Monica, CA', 200.00);

-- ========== Bookings ==========
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '2025-07-01', '2025-07-05', 600.00, 'confirmed'),
  ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', '2025-08-10', '2025-08-12', 400.00, 'pending');

-- ========== Payments ==========
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 600.00, 'credit_card'),
  ('30000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000002', 400.00, 'paypal');

-- ========== Reviews ==========
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('40000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 5, 'Amazing place, very clean and comfortable.'),
  ('40000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 4, 'Nice location but parking was tricky.');

-- ========== Messages ==========
INSERT INTO Message (message_id, user_id, recipient_id, message_body)
VALUES
  ('50000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Hi Bob, I’d like to confirm my stay.'),
  ('50000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Sure! Your booking is confirmed.');