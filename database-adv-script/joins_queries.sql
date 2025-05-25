SELECT b.*, u.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- For PostgreSQL (direct syntax):
SELECT u.*, b.*
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;