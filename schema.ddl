/* 
Constraints:
-- Reaction policies for relations with foreign-key constraints 

 Assumptions:
 -- No flight is longer than 14hrs
 -- Crew members cannot be both flight and ground crew 
 -- No limitations to number of citizenships 
 -- 

*/
DROP SCHEMA IF EXISTS A3Airport CASCADE;
CREATE SCHEMA A3Airport;
SET SEARCH_PATH TO A3AIRPORT;


-- A country where an airport located with a name <name>
CREATE TABLE Country(
	country_id INT PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL
);


-- An Airport, its name <name>, city <city>, and country <country_id>.
CREATE TABLE Airport(
	airport_id INT PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	city VARCHAR(50) NOT NULL,
	country_id INT NOT NULL REFERENCES Country(country_id)
		ON DELETE RESTRICT
);


-- A gate at the airport <airport_id>, its number <gate_num>
CREATE TABLE Gate(
	gate_id INT PRIMARY KEY, 
	airport_id INT NOT NULL REFERENCES Airport(airport_id) 
		ON DELETE CASCADE,
	gate_code VARCHAR(10) UNIQUE NOT NULL
);


-- A route between two airports, an origin airport <origin_airport_id>,
-- a destination airport <destination_airport_id>, route type
-- <internatial> specifies whether a route is international or domestic
CREATE TABLE Route(
	route_id INT PRIMARY KEY,
	origin_airport_id INT NOT NULL REFERENCES Airport(airport_id)
		ON DELETE RESTRICT,
	destination_airport_id INT NOT NULL REFERENCES Airport(airport_id)
		ON DELETE RESTRICT,
	international BOOLEAN NOT NULL
);


-- An airline that operates an airport, their name <name>. 
CREATE TABLE Airline(
	airline_id INT PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);


-- A plane that's operated by an airline, its name <name>,
-- its unique registration number <tail_number>, 
-- when it last arrived at an airport <last_arrival_datetime>,
-- its last arrival aiport <last_arrival_airport> and required crew for a flight
-- <required_in_flight_crew>
CREATE TABLE Plane(
	plane_id INT PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	tail_number INT UNIQUE NOT NULL,
	last_arrival_datetime TIMESTAMP,
	last_arrival_airport INT NOT NULL REFERENCES Airport(airport_id)
		ON DELETE SET NULL,
	required_in_flight_crew INT NOT NULL 
);


-- Flight schedule used by multiple airlines, with flight departure time,
-- <departure_time>, flight arrival time <arrival_time>, days of the week,
-- schedule applies to <days_of_week>, the start date of the schedule,
-- <start_date> and end date of the schedule <end_date>
CREATE TABLE FlightTimes(
	schedule_id INT PRIMARY KEY,
	departure_time TIME NOT NULL,
	arrival_time TIME NOT NULL,
	days_of_week VARCHAR(7) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL
);


-- A flight between two airports operated by an airline <airline_id, 
-- a plane assigned to the flight <plane_id>, flight 
-- route(origin and destination) <route_id>, its departure <date>, 
-- arrival date <date>, flight schedule <schedule_id, the gate its,
-- departing from <gate_id> and the gate its going to arrive at <gate_id>
CREATE TABLE Flight(
	flight_id INT PRIMARY KEY,
	plane_id INT NOT NULL REFERENCES Plane(plane_id),
	route_id INT NOT NULL REFERENCES Route(route_id),
	departure_date DATE NOT NULL,
	arrival_date DATE NOT NULL,
	schedule_id INT NOT NULL REFERENCES FlightTimes(schedule_id)
		ON DELETE RESTRICT,
	departure_gate INT NOT NULL REFERENCES Gate(gate_id)
		ON DELETE RESTRICT,
	arrival_gate INT NOT NULL REFERENCES Gate(gate_id)
		ON DELETE RESTRICT
);


-- A position at the airport, its name <name>
CREATE TABLE Position(
	position_id INT PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL
);


-- Flight crew members at an airport, with name <name>,
-- the airline they work for <airline_id>,
-- their position <position_id>
-- <is_flight_crew> specifies whether they are flight crew members 
-- their first day of employment <start_date> 
CREATE TABLE CrewMember(
	crew_id INT PRIMARY KEY,
	name VARCHAR(30) NOT NULL, 
	airline_id INT NOT NULL REFERENCES Airline(airline_id)
		ON DELETE RESTRICT,
	position INT NOT NULL REFERENCES Position(position_id)
		ON DELETE RESTRICT,
	is_flight_crew BOOLEAN NOT NULL,
	start_date DATE NOT NULL
);


-- Flight crew members assigned to a flight, their id <crew_id>,
-- the flight they are assigned to <flight_id>,
-- their role on the flight <role>,
-- their shift start time <start_time> and shift end time <end_time>
CREATE TABLE FlightCrewAssigment(
	flight_id INT,
	crew_id INT,
	role INT NOT NULL REFERENCES Position(position_id)
		ON DELETE RESTRICT,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL,
	PRIMARY KEY (flight_id, crew_id),
	FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
		ON DELETE CASCADE,
	FOREIGN KEY (crew_id) REFERENCES CrewMember(crew_id)
		ON DELETE CASCADE,
	CHECK (end_time - start_time <= INTERVAL '14 HOURS')
);


-- A plane certified crew member, their member id <crew_id>,
-- and the plane <plane_id> they are certified to work on
CREATE TABLE PlaneCertifiedCrew(
	plane_id INT REFERENCES Plane(plane_id)
		ON DELETE CASCADE,
	crew_id INT REFERENCES CrewMember(crew_id),
	PRIMARY KEY(plane_id, crew_id)
);


-- Ground crew assignment types, name of assignment <assignment_name>
CREATE TABLE AssignmentType(
	assignment_id INT PRIMARY KEY,
	assignment_name VARCHAR(30)
);


-- Ground crew member<crew_id> assignments at the airport, a flight their assigned to <flight_id>,
-- the gate their assigned to <gate_id>, assignment start time at a gate,
-- <assignment_start_time> assignment end time <assignment_end_time>
-- departure/arrival assignment <assignment_type_id>
CREATE TABLE GroundCrewAssignment(
	assignment_id INT PRIMARY KEY,
	crew_id INT REFERENCES CrewMember(crew_id)
		ON DELETE CASCADE,
	flight_id INT NOT NULL REFERENCES Flight(flight_id)
		ON DELETE RESTRICT,
	gate_id INT NOT NULL REFERENCES Gate(gate_id)
		ON DELETE RESTRICT,
	assignment_start_time TIME NOT NULL,
	assignment_end_time TIME NOT NULL,
	assignment_type INT NOT NULL REFERENCES AssignmentType(assignment_id)
		ON DELETE RESTRICT
);


-- A planes scheduled flight, the flight <flight_id>,
--  the time it will be departing <scheduled_departure_time>
--  the time ti will arrive <scheduled_arrival_time>
CREATE TABLE PlaneSchedule(
	plane_id INT NOT NULL,
	flight_id INT NOT NULL REFERENCES Flight(flight_id)
		ON DELETE CASCADE,
	scheduled_departure_time TIME NOT NULL,
	scheduled_arrival_time TIME NOT NULL,
	PRIMARY KEY(plane_id, flight_id)
);


-- A flight gate schedule, the gate where the flight will arrive/depart <gate_id>,
-- the flightits arrival time <arrival_time> at the gate and,
-- its departure time from the gate <departure_time>
CREATE TABLE FlightGateSchedule(
	gate_id INT NOT NULL REFERENCES Gate(gate_id)
		ON DELETE RESTRICT,
	flight_id INT NOT NULL REFERENCES Flight(flight_id)
		ON DELETE CASCADE,
	arrival_time TIME NOT NULL,
	departure_time TIME NOT NULL,
	PRIMARY KEY(gate_id, flight_id)
);


-- A passenger taking a flight, their name <name>, their date of birth,
-- <date_of_birth>, <is_elite> specifies their elite status,
-- their passport number <passport_number>
CREATE TABLE Passenger(
	passenger_id INT PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	date_of_birth DATE NOT NULL,
	passport_number VARCHAR(10) UNIQUE NOT NULL,
	is_elite BOOLEAN NOT NULL
);


-- The citizenship of a passenger <passenger_id> to their country(ies) <country_id>
CREATE TABLE Citizenship(
	passenger_id INT REFERENCES Passenger(passenger_id)
		ON DELETE CASCADE,
	country_id INT REFERENCES Country(country_id)
		ON DELETE RESTRICT,
	PRIMARY KEY(passenger_id, country_id)
);


-- A Visa issued to a non-citizen passenger <passenger_id> travelling
-- internationally, the issuing country <issuing_country_id>,
-- date the visa is issued <issue_date>,
-- and expiry date of the visa <expiry_date> 
CREATE TABLE Visa(
	visa_id INT PRIMARY KEY,
	passenger_id INT NOT NULL REFERENCES Passenger(passenger_id) ON DELETE CASCADE,
	issuing_country_id INT NOT NULL REFERENCES Country(country_id) 
		ON DELETE RESTRICT,
	issuing_date DATE NOT NULL,
	expiry_date DATE NOT NULL
);

-- A booking for a flight/s, its unique code <code>,
-- date when booking was made <booking_date>,
-- <is_stand_by> specifies whether a passenger(s) can have assigned seat,
-- or travel standby
CREATE TABLE Booking(
	booking_id INT PRIMARY KEY,
	booking_date TIMESTAMP NOT NULL,
	is_stand_by BOOLEAN NOT NULL
);

-- A seat on a flight <flight_id>, its number <number>,
-- class e.g economy, business <class>
CREATE TABLE Seat(
	seat_id INT PRIMARY KEY,
	flight_id INT REFERENCES Flight(flight_id),
	number VARCHAR(10),
	UNIQUE (flight_id, number)
);


-- A zone by which passengers board planes, its number <number>
CREATE TABLE Zone(
	zone_id INT PRIMARY KEY,
	zone_number INT NOT NULL
);


-- A ticket for a flight/route, the booking its part of <booking_id>,
-- the passenger who bought the ticket <passenger_id>,
-- the flight <flight_id> if passenger has an assigned seat <seat_id>,
-- the route <route_id> the passenger has booked, and 
-- boarding zone <zone_id>
CREATE TABLE Ticket(
	ticked_id INT PRIMARY KEY,
	booking_id INT REFERENCES Booking(booking_id)
		ON DELETE CASCADE,
	passenger_id INT REFERENCES Passenger(passenger_id)
		ON DELETE CASCADE, 
	flight_id INT REFERENCES Flight(flight_id)
		ON DELETE RESTRICT,
	seat_id INT REFERENCES Seat(seat_id)
		ON DELETE RESTRICT,
	route_id INT REFERENCES Route(route_id)
		ON DELETE RESTRICT,
	zone_id INT REFERENCES Zone(zone_id)
		ON DELETE SET NULL
);


-- Checked luggage a passenger <passenger_id> is travelling with, 
-- the weight <weight> of the luggage  
CREATE TABLE Luggage(
	luggage_id INT PRIMARY KEY,
	passenger_id INT NOT NULL REFERENCES Passenger(passenger_id)
		ON DELETE CASCADE,
	weight FLOAT NOT NULL
);
