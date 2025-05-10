
Key Features:
1. **Realistic Data Relationships**:
   - 1 host, 1 guest, 1 admin
   - 2 properties owned by the host
   - 2 bookings (confirmed & pending)
   - 1 completed payment
   - 2 reviews
   - 2 messages

2. **Data Consistency**:
   - Fixed UUIDs for cross-table relationships
   - Prices calculated as `price_per_night * days`
   - Logical date ranges (end_date > start_date)
   - Valid ENUM values for status and payment methods

3. **Security Considerations**:
   - Placeholder password hashes (use proper bcrypt in production)
   - Valid phone number formats
   - Realistic email addresses

4. **Temporal Data**:
   - Past and future bookings
   - Sequential message timestamps
   - Automatic created_at timestamps



This dataset provides:
- 100% constraint compliance
- Real-world booking patterns
- Mixed status scenarios
- Complete relationship chains
- Testable message threads
- Review coverage for all properties

Adjust quantities and values as needed for your testing requirements!