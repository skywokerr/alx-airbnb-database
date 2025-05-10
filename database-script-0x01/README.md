
Key Features:
1. **Data Types**: Uses appropriate data types for each field
2. **Constraints**:
   - Primary keys with UUID
   - Foreign key relationships
   - NOT NULL constraints where required
   - Check constraints (e.g., rating between 1-5)
   - Unique email constraint
3. **Indexes**:
   - Automatic primary key indexes
   - Optimized indexes for common query patterns
   - Foreign key indexes for join performance
4. **Default Values**:
   - UUID generation for primary keys
   - Current timestamps for creation dates
5. **Triggers**:
   - Auto-update for Property.updated_at
   - PostgreSQL-specific function for timestamp updates

This implementation ensures:
- Third Normal Form (3NF) compliance
- Referential integrity through foreign keys
- Data consistency through constraints
- Optimal query performance through indexing
- Auditability through timestamp tracking

The schema supports all required operations while maintaining data integrity and performance.