SET profiling = 1;

SELECT * 
FROM booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';

SHOW PROFILE FOR QUERY 1;
-- PostgreSQL or MySQL
CREATE INDEX idx_booking_start_date ON booking(start_date);
CREATE INDEX idx_booking_user_id ON booking(user_id);

EXPLAIN ANALYZE
SELECT * 
FROM booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';

## Query Performance Monitoring Report

*Goal:* Improve performance of frequent database queries by monitoring execution and making schema adjustments.

---

### Query Monitored:
```sql
SELECT * 
FROM booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';