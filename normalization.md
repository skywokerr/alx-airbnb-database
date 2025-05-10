# Database Normalization to Third Normal Form (3NF)

### First Normal Form (1NF)
- All tables have primary keys
- All attributes are atomic (no repeating groups or composite values)
- No duplicate rows
 **1NF is satisfied**

### Second Normal Form (2NF)
- All tables are in 1NF
- All non-key attributes are fully functionally dependent on the entire primary key
- No partial dependencies exist
 **2NF is satisfied**

### Third Normal Form (3NF)
- All tables are in 2NF
- No transitive dependencies exist (non-key attributes don't depend on other non-key attributes)

## Potential Issues and Improvements

1. **Calculated Field in Booking Table**:
   - `total_price` in the Booking table could be considered a derived attribute (calculated from `price_per_night` and date difference)
   - However, this is acceptable as it represents the actual agreed price which might differ from current property pricing

2. **User Roles**:
   - The `role` enum in User table is properly constrained
   - No normalization issues here

3. **Temporal Data**:
   - All timestamp fields are properly implemented

## Verification of 3NF Compliance

Let's examine each table:

### User Table
- All attributes depend only on `user_id`
- No transitive dependencies
 **3NF compliant**

### Property Table
- All attributes depend only on `property_id`
- `host_id` is a proper foreign key reference
 **3NF compliant**

### Booking Table
- All attributes depend only on `booking_id`
- Foreign keys properly reference other tables
- While `total_price` could be calculated, storing it is acceptable for historical accuracy
 **3NF compliant**

### Payment Table
- All attributes depend only on `payment_id`
- Proper foreign key to Booking
 **3NF compliant**

### Review Table
- All attributes depend only on `review_id`
- Proper foreign keys
- Rating constraint is properly implemented
 **3NF compliant**

### Message Table
- All attributes depend only on `message_id`
- Proper foreign keys for sender/recipient
 **3NF compliant**

## Final Assessment

The database schema as provided is already in Third Normal Form (3NF). No modifications are needed to achieve normalization objectives because:

1. All tables have single-purpose primary keys
2. There are no partial dependencies (2NF satisfied)
3. There are no transitive dependencies (3NF satisfied)
4. All relationships are properly established through foreign keys
5. Derived data is minimized (only `total_price` could be considered derived, but it's justified)
