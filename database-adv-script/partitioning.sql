
CREATE TABLE bookings_partitioned (
    booking_id BIGSERIAL,
    user_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    amount_paid DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

CREATE TABLE bookings_2023_jan PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');
    
CREATE TABLE bookings_2023_feb PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-02-01') TO ('2023-03-01');
    
CREATE TABLE bookings_2024_jan PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');
    
CREATE TABLE bookings_2024_feb PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

CREATE TABLE bookings_future PARTITION OF bookings_partitioned
    DEFAULT;

INSERT INTO bookings_partitioned 
SELECT * FROM bookings;

CREATE INDEX idx_bookings_partitioned_user_id ON bookings_partitioned(user_id);
CREATE INDEX idx_bookings_partitioned_property_id ON bookings_partitioned(property_id);
CREATE INDEX idx_bookings_partitioned_status ON bookings_partitioned(status);

EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-01-31';

EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-01-31';