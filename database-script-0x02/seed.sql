
-- Clear existing data (not a must)
-- TRUNCATE TABLE Message, Review, Payment, Booking, Property, "User" CASCADE;

-- Insert Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
-- Host user
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'John', 'Doe', 'john@host.com', 
'$2a$10$N9qo8uLOickgx3ZMRM7xQO5XgBpE1BynbW7B5KQ', '+11234567890', 'host'),

-- Guest user
('b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Alice', 'Smith', 'alice@guest.com', 
'$2a$10$N9qo8uLOickgx3ZMRM7xQO5XgBpE1BynbW7B5KQ', '+441234567890', 'guest'),

-- Admin user
('c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Admin', 'User', 'admin@system.com', 
'$2a$10$N9qo8uLOickgx3ZMRM7xQO5XgBpE1BynbW7B5KQ', '+33123456789', 'admin');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night) VALUES
-- Paris property
('d3eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
 'Cozy Paris Apartment', 'Beautiful 2-bedroom in city center', 'Paris', 150.00),

-- Rome property
('e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
 'Modern Rome Loft', 'Stylish loft near Colosseum', 'Rome', 200.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
-- Confirmed Paris booking
('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 
 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', '2024-03-01', '2024-03-05', 600.00, 'confirmed'),

-- Pending Rome booking
('f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a77', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 
 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', '2024-06-15', '2024-06-20', 1000.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
-- Payment for confirmed booking
('g7eebc99-9c0b-4ef8-bb6d-6bb9bd380a88', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 
 600.00, 'credit_card');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
-- Review for Paris property
('h8eebc99-9c0b-4ef8-bb6d-6bb9bd380a99', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 
 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 5, 'Fantastic location and amenities!'),

-- Review for Rome property
('i9eebc99-9c0b-4ef8-bb6d-6bb9bd380a00', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 
 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 4, 'Great space but noisy at night');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
-- Host to guest
('j0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 
 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Welcome to our Paris apartment!'),

-- Guest to host
('k1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 
 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Thanks, looking forward to our stay!');


#To verify the data:

-- Check user-property relationships
SELECT u.email AS host_email, p.name AS property_name
FROM "User" u
JOIN Property p ON u.user_id = p.host_id;

-- View booking details
SELECT b.start_date, b.end_date, p.name AS property, u.email AS guest_email
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
JOIN "User" u ON b.user_id = u.user_id;

-- See payment status
SELECT b.status, p.amount, p.payment_method
FROM Booking b
LEFT JOIN Payment p ON b.booking_id = p.booking_id;

