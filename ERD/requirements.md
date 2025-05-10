## Identify Entities and Attributes
The database specification provides six entities, each with specific attributes and constraints. Below, I’ll list each entity and its attributes as they will appear in the ER diagram. In a standard ER diagram, we focus on the conceptual structure—entities, attributes, and relationships—while indicating primary keys (PK) and foreign keys (FK). Detailed constraints like NOT NULL or data types (e.g., VARCHAR, UUID) are typically omitted unless specified, so I’ll keep it simple and clear for Draw.io.
User
user_id (PK)

first_name

last_name

email (UNIQUE)

password_hash

phone_number

role

created_at

Property
property_id (PK)

host_id (FK, references User(user_id))

name

description

location

pricepernight

created_at

updated_at

Booking
booking_id (PK)

property_id (FK, references Property(property_id))

user_id (FK, references User(user_id))

start_date

end_date

total_price

status

created_at

Payment
payment_id (PK)

booking_id (FK, references Booking(booking_id))

amount

payment_date

payment_method

Review
review_id (PK)

property_id (FK, references Property(property_id))

user_id (FK, references User(user_id))

rating

comment

created_at

Message
message_id (PK)

sender_id (FK, references User(user_id))

recipient_id (FK, references User(user_id))

message_body

sent_at

## Define Relationships Between Entities
Relationships are determined by the foreign keys in the specification, indicating how entities are connected. I’ll define each relationship, including cardinality (e.g., one-to-many, 1:N), which will be represented in the ER diagram.
User to Property
Relationship: A User (host) can own multiple Properties, but each Property is owned by one User.

Foreign Key: host_id in Property references user_id in User.

Cardinality: 1 (User) to N (Property).

Property to Booking
Relationship: A Property can have multiple Bookings, but each Booking is for one Property.

Foreign Key: property_id in Booking references property_id in Property.

Cardinality: 1 (Property) to N (Booking).

User to Booking
Relationship: A User (guest) can make multiple Bookings, but each Booking is made by one User.

Foreign Key: user_id in Booking references user_id in User.

Cardinality: 1 (User) to N (Booking).

Booking to Payment
Relationship: A Booking can have multiple Payments (e.g., installments), but each Payment is linked to one Booking.

Foreign Key: booking_id in Payment references booking_id in Booking.

Cardinality: 1 (Booking) to N (Payment).

Property to Review
Relationship: A Property can have multiple Reviews, but each Review is for one Property.

Foreign Key: property_id in Review references property_id in Property.

Cardinality: 1 (Property) to N (Review).

User to Review
Relationship: A User can write multiple Reviews, but each Review is written by one User.

Foreign Key: user_id in Review references user_id in User.

Cardinality: 1 (User) to N (Review).

User to Message (Sender)
Relationship: A User can send multiple Messages, but each Message has one sender.

Foreign Key: sender_id in Message references user_id in User.

Cardinality: 1 (User) to N (Message).

Role: "sends".

User to Message (Recipient)
Relationship: A User can receive multiple Messages, but each Message has one recipient.

Foreign Key: recipient_id in Message references user_id in User.

Cardinality: 1 (User) to N (Message).

Role: "receives".

The Message entity has two distinct relationships with **User** (**sender** and **recipient**), which I’ll represent with separate labeled connections in the diagram.

