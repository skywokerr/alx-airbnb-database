
SELECT 
  u.id AS user_id,
  u.name AS user_name,
  COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;

WITH property_booking_stats AS (
  SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings
  FROM properties p
  LEFT JOIN bookings b ON p.id = b.property_id
  GROUP BY p.id, p.name
)
SELECT 
  property_id,
  property_name,
  total_bookings,
  RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM property_booking_stats
ORDER BY booking_rank;