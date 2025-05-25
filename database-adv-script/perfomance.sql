
-- Initial query: Retrieves all bookings with user, property, and payment details
SELECT *
FROM bookings b
LEFT JOIN users u ON b.user_id = u.id
LEFT JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pm ON b.id = pm.booking_id;

EXPLAIN ANALYZE
SELECT * 
FROM bookings b
LEFT JOIN users u ON b.user_id = u.id
...;

-- Refactored query: Minimized columns, leveraged indexes
SELECT 
  b.id AS booking_id,
  b.check_in_date,
  b.check_out_date,
  u.id AS user_id,
  u.name AS user_name,
  p.id AS property_id,
  p.name AS property_name,
  pm.amount,
  pm.payment_status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id        -- Use INNER JOIN if all bookings have a user
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pm ON b.id = pm.booking_id -- Keep LEFT JOIN if payments are optional
WHERE b.check_in_date >= '2023-01-01';        -- Add filters to reduce dataset early

