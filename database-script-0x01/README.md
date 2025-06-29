## 🗂️ Database Entities

### 1. *User*
Stores information about guests, hosts, and admins.

| Field | Type | Notes |
|-------|------|-------|
| user_id | UUID | Primary Key |
| first_name, last_name | VARCHAR | Required |
| email | VARCHAR | Unique |
| password_hash | VARCHAR | Hashed password |
| phone_number | VARCHAR | Optional |
| role | ENUM | guest, host, admin |
| created_at | TIMESTAMP | Default: now |

---

### 2. *Property*
Listings created by hosts.

| Field | Type | Notes |
|-------|------|-------|
| property_id | UUID | Primary Key |
| user_id | UUID | FK → User |
| name, description | VARCHAR/TEXT | Required |
| location | VARCHAR | Not normalized for simplicity |
| pricepernight | DECIMAL | Nightly rate |
| created_at, updated_at | TIMESTAMP | Auto-managed |

---

### 3. *Booking*
Tracks reservations made by users.

| Field | Type | Notes |
|-------|------|-------|
| booking_id | UUID | Primary Key |
| property_id, user_id | UUID | Foreign Keys |
| start_date, end_date | DATE | Required |
| total_price | DECIMAL | Calculated or stored |
| status | ENUM | pending, confirmed, canceled |
| created_at | TIMESTAMP | Default: now |

---

### 4. *Payment*
Stores payments made for bookings.

| Field | Type | Notes |
|-------|------|-------|
| payment_id | UUID | Primary Key |
| booking_id | UUID | FK → Booking |
| amount | DECIMAL | Payment total |
| payment_date | TIMESTAMP | Default: now |
| payment_method | ENUM | credit_card, paypal, stripe |

---

### 5. *Review*
User reviews for properties.

| Field | Type | Notes |
|-------|------|-------|
| review_id | UUID | Primary Key |
| property_id, user_id | UUID | Foreign Keys |
| rating | INTEGER | 1 to 5 |
| comment | TEXT | Required |
| created_at | TIMESTAMP | Default: now |

---

### 6. *Message*
Private messages between users.

| Field | Type | Notes |
|-------|------|-------|
| message_id | UUID | Primary Key |
| user_id, recipient_id | UUID | FK → User |
| message_body | TEXT | Required |
| sent_at | TIMESTAMP | Default: now |

---

## 📊 Normalization Summary

The schema adheres to *Third Normal Form (3NF)*:

- *1NF*: Atomic values, no repeating groups.
- *2NF*: All non-key attributes depend on the entire primary key.
- *3NF*: No transitive dependencies; all attributes depend only on the key.

---

## 🛠️ Setup Instructions

### Prerequisites
- PostgreSQL (or any standard SQL-compatible RDBMS)
- SQL client (e.g., pgAdmin, DBeaver, psql)

### Running the Schema
1. Clone this repository.
2. Open your SQL client.
3. Run the SQL file: