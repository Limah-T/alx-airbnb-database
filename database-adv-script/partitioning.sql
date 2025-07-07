-- Step 1: Create a new partitioned table based on RANGE of start_date
CREATE TABLE booking_partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions by date ranges (you can adjust years/ranges)
CREATE TABLE booking_2023 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


-- Before (on original booking table)
EXPLAIN ANALYZE
SELECT * FROM booking WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';

-- After (on partitioned table)
EXPLAIN ANALYZE
SELECT * FROM booking_partitioned WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';