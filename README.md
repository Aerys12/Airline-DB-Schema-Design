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
   git clone https://github.com/Aerys12/AirportOpsDB.git
   cd AirportOpsDB```
2. **Intialize your database**
   
