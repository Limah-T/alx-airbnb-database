## Booking Table Partitioning Report

*Objective:* Improve query performance on the large booking table using table partitioning.

### Partition Strategy
The booking table was partitioned by start_date using RANGE partitioning. Each partition covers a specific year.

### Observed Improvements
- Queries filtered by start_date showed *noticeable performance gains*, especially for date-specific queries.
- EXPLAIN ANALYZE revealed that *only relevant partitions were scanned*, reducing I/O and query time.
- Improved *maintenance* and *archival* potential: old partitions can be dropped or indexed separately.

### Conclusion
Partitioning is effective for time-series data like bookings. It improved query performance and makes long-term scaling easier.