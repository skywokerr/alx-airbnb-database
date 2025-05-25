-- Indexes for the bookings table (most frequent JOINs/filters)
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_check_in_date ON bookings (check_in_date);

-- Indexes for users and properties (primary keys are often auto-indexed, but verify)
CREATE INDEX idx_users_id ON users (id);          -- If not already a PK index
CREATE INDEX idx_properties_id ON properties (id);-- If not already a PK index

EXPLAIN ANALYZE
SELECT u.*
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE check_in_date BETWEEN '2023-01-01' AND '2023-12-31';