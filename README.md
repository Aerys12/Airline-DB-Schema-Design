# Airline-DB-Schema-Design
A comprehensive PostgreSQL schema for modelling and managing every aspect of commercial flight operations
## 🚀 Project Overview

AirportOpsDB is designed to power back-end systems for airlines, airports, and travel platforms. It captures:

- **Global airport network**  
  Countries → Airports → Gates  
- **Flight planning & scheduling**  
  Routes → FlightTimes → Flights → Gate & Plane schedules  
- **Aircraft management**  
  Airlines → Planes → Certification of crew per aircraft  
- **Crew management**  
  Positions → CrewMembers → FlightCrew & GroundCrew assignments  
- **Passenger & booking lifecycle**  
  Passengers → Citizenship & Visas → Bookings → Tickets → Seats & Zones → Luggage  

All relationships and business rules (e.g. visa requirements, crew scheduling limits, cascade policies) are enforced through foreign-key constraints and check clauses.

## 🔑 Key Entities

| Table                        | Purpose                                                                                  |
|------------------------------|------------------------------------------------------------------------------------------|
| **Country**                  | ISO-style country list for airports & passports                                          |
| **Airport**                  | Airport metadata (name, city, country)                                                   |
| **Gate**                     | Individual gates within an airport                                                       |
| **Route**                    | Origin–destination pair, flag for international vs. domestic                              |
| **FlightTimes**              | Reusable weekly schedule templates (days, start/end dates, departure/arrival times)       |
| **Flight**                   | Actual flights tied to a schedule, route, plane & gates                                  |
| **Position**                 | Job titles (Pilot, Flight Attendant, Baggage Handler, etc.)                              |
| **CrewMember**               | Employee records, linked to an airline and a single position                             |
| **FlightCrewAssignment**     | Flight-specific crew rosters (with 14-hour max shift enforced)                           |
| **GroundCrewAssignment**     | Gate-side assignments for ground staff                                                  |
| **PlaneCertifiedCrew**       | Which crew can operate which aircraft                                                    |
| **Passenger**                | Customer profiles (with elite status flag)                                              |
| **Citizenship** & **Visa**   | Multi-national passport data & international travel permissions                          |
| **Booking** & **Ticket**     | Reservation records (standby vs. assigned seats)                                         |
| **Seat** & **Zone**          | Seat numbering & boarding zones                                                          |
| **Luggage**                  | Checked-bag records per passenger                                                        |
| **PlaneSchedule**            | Plane ↔ Flight linking for dispatch planning                                             |
| **FlightGateSchedule**       | Gate occupancy schedule per flight                                                       |

## ⚙️ Getting Started

1. **Clone the repo**  
   ```bash
   git clone https://github.com/Aerys12/Airline-DB-Schema-Design.git
2. **Intialize your database**
   ```bash
   psql -f schema.sql
3. ** Seed sample data (optional)
   ```bash
   psql -f data.sql
4. **Intergrate with your application
   Connect via your preferrred ORM or query runner

📈 Features & Benefits
-Strict data integrity via ON DELETE rules and CHECK constraints
-Highly normalized design to avoid redundancy
-Built-in business logic (crew shift limits, visa checks)
-Extensible: easily add new entities (e.g., cargo, loyalty tiers)
-Modular scheduling thanks to FlightTimes templates

## 🛠️ Example Queries

Each of the example operations is provided in its own SQL script file in the project root:

- `q1.sql` – **Total Passengers per Airport (2023)**: Returns each airport’s name alongside the number of **distinct** passengers who departed or arrived there in 2023.
- `q2.sql` – **Top Travelers per Route (2023)**: Identifies, for every route, the passenger(s) who flew that route most often in 2023.
- `q3.sql` – **Low-Visa International Routes**: Finds international routes where the average number of visa-requiring passengers per flight is >0 but <25% of the overall international-route average.
- `q4.sql` – **Frequent Crew–Plane Assignments**: Lists airline crew members (flight or ground) who worked on the same plane **at least 10 times** during 2023.

### Running the Scripts

**From your shell:**
```bash
psql -U <username> -d <database> -f q1.sql
psql -U <username> -d <database> -f q2.sql
# …and so on for q3.sql, q4.sql
```

**Inside a `psql` session:**
```sql
SET search_path TO A3Airport;
\i q1.sql   -- load and run q1.sql
\i q2.sql   -- load and run q2.sql
-- etc.
```

Replace `<username>` and `<database>` with your credentials. Each script assumes the `A3Airport` schema is active.


