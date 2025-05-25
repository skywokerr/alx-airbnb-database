
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' AND pay.payment_status = 'completed';

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    pay.amount,
    pay.payment_method,
    pay.payment_status
FROM bookings b
JOIN (
    SELECT user_id, username, email 
    FROM users
    WHERE is_active = true
) u ON b.user_id = u.user_id
JOIN (
    SELECT property_id, property_name, location, price_per_night
    FROM properties
    WHERE is_available = true
) p ON b.property_id = p.property_id
LEFT JOIN (
    SELECT booking_id, amount, payment_method, payment_status
    FROM payments
    WHERE payment_status = 'completed'
) pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' 
  AND b.start_date > CURRENT_DATE - INTERVAL '1 year'
  AND (pay.payment_id IS NOT NULL OR b.amount_paid > 0);