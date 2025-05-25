
SELECT 
    user_id, 
    COUNT(*) as total_bookings
FROM bookings
GROUP BY user_id
ORDER BY total_bookings DESC;


SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) as total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) as booking_rank
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name
ORDER BY booking_rank;


SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) as total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) as row_num
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name
ORDER BY total_bookings DESC;