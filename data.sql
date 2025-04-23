-- Data for the countries 
INSERT INTO Country (country_id, name) VALUES
(1, 'Country A'),
(2, 'Country B'),
(3, 'Country C'),
(4, 'Country D'),
(5, 'Country E');

INSERT INTO Airport (airport_id, name, city, country_id) VALUES
-- Airports in different countries
(1, 'Alpha International', 'City A1', 1), -- Country A
(2, 'Beta Regional', 'City B1', 2),       -- Country B
(3, 'Gamma Airport', 'City C1', 3),       -- Country C
(4, 'Delta Airport', 'City D1', 4),       -- Country D
(5, 'Epsilon Airport', 'City E1', 5);     -- Country E


INSERT INTO Gate (gate_id, airport_id, gate_code) VALUES
-- Gates for Airport 1 (Alpha International)
(1, 1, 'A1'),
(2, 1, 'A2'),
(3, 1, 'A3'),

-- Gates for Airport 2 (Beta Regional)
(4, 2, 'B1'),
(5, 2, 'B2'),

-- Gates for Airport 3 (Gamma Airport) - No passengers
(6, 3, 'C1'),

-- Gates for Airport 4 (Delta Airport)
(7, 4, 'D1'),
(8, 4, 'D2'),
(9, 4, 'D3'),

-- Gates for Airport 5 (Epsilon Airport)
(10, 5, 'E1'),
(11, 5, 'E2');


INSERT INTO Route (route_id, origin_airport_id, destination_airport_id, international) VALUES
(1, 1, 2, TRUE),  -- From Airport 1 (Country A) to Airport 2 (Country B)
(2, 2, 1, TRUE),  -- From Airport 2 (Country B) to Airport 1 (Country A)
(3, 1, 3, TRUE),  -- From Airport 1 (Country A) to Airport 3 (Country C)
(4, 2, 3, TRUE),  -- From Airport 2 (Country B) to Airport 3 (Country C)
(5, 4, 5, TRUE),  -- From Airport 4 (Country D) to Airport 5 (Country E)
(6, 5, 4, TRUE),  -- From Airport 5 (Country E) to Airport 4 (Country D)
(7, 1, 4, TRUE),  -- From Airport 1 (Country A) to Airport 4 (Country D)
(8, 2, 5, TRUE),  -- From Airport 2 (Country B) to Airport 5 (Country E)
(9, 3, 5, TRUE),  -- From Airport 3 (Country C) to Airport 5 (Country E)
(10, 1, 5, TRUE), -- From Airport 1 (Country A) to Airport 5 (Country E)
(11, 2, 4, TRUE), -- From Airport 2 (Country B) to Airport 4 (Country D)
(12, 3, 4, TRUE); -- From Airport 3 (Country C) to Airport 4 (Country D)


INSERT INTO Airline (airline_id, name) VALUES
(1, 'Air Alpha'),
(2, 'Beta Airlines'),
(3, 'Gamma Airways'),
(4, 'Delta Flights'),
(5, 'Epsilon Air');


INSERT INTO Plane (plane_id, name, tail_number, last_arrival_datetime, last_arrival_airport, required_in_flight_crew) VALUES
(1, 'Plane A1', 1001, '2023-01-10 08:00:00', 1, 5),
(2, 'Plane A2', 1002, '2023-02-15 09:00:00', 1, 5),
(3, 'Plane B1', 2001, '2023-03-20 10:00:00', 2, 4),
(4, 'Plane C1', 3001, '2023-04-25 11:00:00', 3, 6),
(5, 'Plane D1', 4001, '2023-05-30 12:00:00', 4, 5),
(6, 'Plane E1', 5001, '2023-06-05 13:00:00', 5, 5);


INSERT INTO FlightTimes (schedule_id, departure_time, arrival_time, days_of_week, start_date, end_date) VALUES
(1, '08:00:00', '10:00:00', 'MTWRF--', '2023-01-01', '2023-12-31'),
(2, '14:00:00', '16:00:00', '-----SS', '2023-01-01', '2023-12-31'),
(3, '09:00:00', '11:00:00', 'MTW----', '2023-01-01', '2023-06-30'),
(4, '18:00:00', '20:00:00', '--WTF--', '2023-07-01', '2023-12-31'),
(5, '07:00:00', '09:00:00', 'MTWRFSS', '2023-03-01', '2023-09-30');


INSERT INTO Flight (flight_id, plane_id, route_id, departure_date, arrival_date, schedule_id, departure_gate, arrival_gate) VALUES
(1, 1, 1, '2023-01-02', '2023-01-02', 1, 1, 4),
(2, 1, 2, '2023-01-03', '2023-01-03', 1, 4, 1),
(3, 1, 1, '2023-01-04', '2023-01-04', 1, 1, 4),
(4, 1, 2, '2023-01-05', '2023-01-05', 1, 4, 1),
(5, 1, 1, '2023-01-06', '2023-01-06', 1, 1, 4),
(6, 1, 2, '2023-01-07', '2023-01-07', 2, 4, 1),
(7, 1, 1, '2023-01-08', '2023-01-08', 2, 1, 4),
(8, 1, 2, '2023-01-09', '2023-01-09', 1, 4, 1),
(9, 1, 1, '2023-01-10', '2023-01-10', 1, 1, 4),
(10, 1, 2, '2023-01-11', '2023-01-11', 1, 4, 1),
(11, 2, 3, '2023-02-01', '2023-02-01', 3, 2, 6),
(12, 2, 3, '2023-02-08', '2023-02-08', 3, 2, 6),
(13, 3, 4, '2023-03-01', '2023-03-01', 3, 4, 6),
(14, 4, 5, '2023-04-01', '2023-04-01', 4, 7, 10),
(15, 5, 6, '2023-05-01', '2023-05-01', 5, 10, 7),
(16, 1, 1, '2023-05-10', '2023-05-10', 1, 1, 4),
(17, 1, 2, '2023-05-15', '2023-05-15', 1, 4, 1),
(18, 1, 1, '2023-06-20', '2023-06-20', 1, 1, 4),
(19, 1, 2, '2023-07-25', '2023-07-25', 1, 4, 1),
(20, 1, 1, '2023-08-30', '2023-08-30', 1, 1, 4);


INSERT INTO Position (position_id, name) VALUES
(1, 'Pilot'),
(2, 'Co-Pilot'),
(3, 'Flight Attendant'),
(4, 'Ground Crew'),
(5, 'Gate Agent'),
(6, 'Maintenance Engineer'),
(7, 'Baggage Handler'),
(8, 'Air Traffic Controller'),
(9, 'Security Officer');


-- Insert data into CrewMember table
INSERT INTO CrewMember (crew_id, name, airline_id, position, is_flight_crew, start_date) VALUES
(1, 'Alice Johnson', 1, 1, TRUE, '2022-01-01'),  -- Pilot for Air Alpha
(2, 'Brian Lee', 1, 2, TRUE, '2022-02-01'),      -- Co-Pilot for Air Alpha
(3, 'Carol Smith', 1, 3, TRUE, '2022-03-01'),    -- Flight Attendant for Air Alpha
(4, 'Daniel Wilson', 1, 4, FALSE, '2021-05-15'), -- Ground Crew for Air Alpha
(5, 'Emily Davis', 2, 1, TRUE, '2022-04-01'),    -- Pilot for Beta Airlines
(6, 'Frank Miller', 2, 4, FALSE, '2021-07-20'),  -- Ground Crew for Beta Airlines
(7, 'Grace Lee', 3, 1, TRUE, '2022-05-01'),      -- Pilot for Gamma Airways
(8, 'Henry Kim', 4, 4, FALSE, '2021-08-10'),     -- Ground Crew for Delta Flights
(9, 'Irene Chen', 5, 4, FALSE, '2021-09-05');    -- Ground Crew for Epsilon Air


-- Certifications for Air Alpha crew members on plane_id = 1
INSERT INTO PlaneCertifiedCrew (plane_id, crew_id) VALUES
(1, 1),  -- Alice Johnson
(1, 2),  -- Brian Lee
(1, 3);  -- Carol Smith

-- Certification for Beta Airlines crew member on plane_id = 2
INSERT INTO PlaneCertifiedCrew (plane_id, crew_id) VALUES
(2, 5);  -- Emily Davis

-- Certification for Gamma Airways crew member on plane_id = 3
INSERT INTO PlaneCertifiedCrew (plane_id, crew_id) VALUES
(3, 7);  -- Grace Lee


-- Insert data into FlightCrewAssigment table
-- Assigning Alice Johnson (crew_id=1) to flights involving plane_id=1
INSERT INTO FlightCrewAssigment (flight_id, crew_id, role, start_time, end_time) VALUES
(1, 1, 1, '08:00:00', '10:00:00'),
(2, 1, 1, '08:00:00', '10:00:00'),
(3, 1, 1, '08:00:00', '10:00:00'),
(4, 1, 1, '08:00:00', '10:00:00'),
(5, 1, 1, '08:00:00', '10:00:00'),
(6, 1, 1, '14:00:00', '16:00:00'),
(7, 1, 1, '14:00:00', '16:00:00'),
(8, 1, 1, '08:00:00', '10:00:00'),
(9, 1, 1, '08:00:00', '10:00:00'),
(10, 1, 1, '08:00:00', '10:00:00'),
(16, 1, 1, '08:00:00', '10:00:00'),
(17, 1, 1, '08:00:00', '10:00:00'),
(18, 1, 1, '08:00:00', '10:00:00'),
(19, 1, 1, '08:00:00', '10:00:00'),
(20, 1, 1, '08:00:00', '10:00:00');


-- Insert data into AssignmentType table
INSERT INTO AssignmentType (assignment_id, assignment_name) VALUES
(1, 'Departure'),
(2, 'Arrival');



-- Assignments for Air Alpha (airline_id = 1) departures

-- Flights operated by Air Alpha using plane_id = 1
-- Ground crew member Daniel Wilson (crew_id = 4)

INSERT INTO GroundCrewAssignment (assignment_id, crew_id, flight_id, gate_id, assignment_start_time, assignment_end_time, assignment_type) VALUES
(1, 4, 1, 1, '07:30:00', '08:15:00', 1),
(2, 4, 3, 1, '07:30:00', '08:15:00', 1),
(3, 4, 5, 1, '07:30:00', '08:15:00', 1),
(4, 4, 8, 1, '07:30:00', '08:15:00', 1),
(5, 4, 9, 1, '07:30:00', '08:15:00', 1),
(6, 4, 10, 1, '07:30:00', '08:15:00', 1),
(7, 4, 16, 1, '07:30:00', '08:15:00', 1),
(8, 4, 18, 1, '07:30:00', '08:15:00', 1),
(9, 4, 20, 1, '07:30:00', '08:15:00', 1),
(10, 4, 2, 4, '13:30:00', '14:15:00', 1),
(11, 4, 4, 4, '13:30:00', '14:15:00', 1),
(12, 4, 6, 4, '13:30:00', '14:15:00', 1),
(13, 4, 17, 4, '13:30:00', '14:15:00', 1),
(14, 4, 19, 4, '13:30:00', '14:15:00', 1);


-- Assignments for Beta Airlines (airline_id = 2)

-- Ground crew member Frank Miller (crew_id = 6)
INSERT INTO GroundCrewAssignment (assignment_id, crew_id, flight_id, gate_id, assignment_start_time, assignment_end_time, assignment_type) VALUES
(15, 6, 11, 2, '08:30:00', '09:15:00', 1),
(16, 6, 12, 2, '08:30:00', '09:15:00', 1);


-- Optional arrival assignments (not required)
-- Assign Daniel Wilson to arrival assignments
INSERT INTO GroundCrewAssignment (assignment_id, crew_id, flight_id, gate_id, assignment_start_time, assignment_end_time, assignment_type) VALUES
(17, 4, 2, 1, '10:15:00', '10:45:00', 2),
(18, 4, 4, 1, '10:15:00', '10:45:00', 2);



-- Insert data into PlaneSchedule
INSERT INTO PlaneSchedule (plane_id, flight_id, scheduled_departure_time, scheduled_arrival_time) VALUES
(1, 1, '08:00:00', '10:00:00'),
(1, 2, '08:00:00', '10:00:00'),
(1, 3, '08:00:00', '10:00:00'),
(1, 4, '08:00:00', '10:00:00'),
(1, 5, '08:00:00', '10:00:00'),
(1, 6, '14:00:00', '16:00:00'),
(1, 7, '16:30:00', '18:30:00'),
(1, 8, '08:00:00', '10:00:00'),
(1, 9, '08:00:00', '10:00:00'),
(1, 10, '08:00:00', '10:00:00'),
(1, 16, '08:00:00', '10:00:00'),
(1, 17, '08:00:00', '10:00:00'),
(1, 18, '08:00:00', '10:00:00'),
(1, 19, '08:00:00', '10:00:00'),
(1, 20, '08:00:00', '10:00:00');

-- Insert data into FlightGateSchedule
-- For departure gates (planes arrive 30 minutes before departure)
-- For arrival gates (planes stay 30 minutes after arrival)
-- Ensure that the same plane using flights within 2 hours uses the same gate

-- Flight 1
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(1, 1, '07:30:00', '08:00:00'); -- Departure from Gate 1

-- Flight 2
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(4, 2, '07:30:00', '08:00:00'); -- Departure from Gate 4

-- Flight 3
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(1, 3, '07:30:00', '08:00:00'); -- Departure from Gate 1

-- Flight 4
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(4, 4, '07:30:00', '08:00:00'); -- Departure from Gate 4

-- Flight 5
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(1, 5, '07:30:00', '08:00:00'); -- Departure from Gate 1

-- Flights 6 and 7 are within 2 hours and use the same gate
-- Flight 6
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(4, 6, '13:30:00', '14:00:00'); -- Departure from Gate 4

-- Flight 7
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(4, 7, '16:00:00', '16:30:00'); -- Departure from Gate 4

-- Flight 8
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(4, 8, '07:30:00', '08:00:00'); -- Departure from Gate 4

-- Flight 9
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(1, 9, '07:30:00', '08:00:00'); -- Departure from Gate 1

-- Flight 10
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(4, 10, '07:30:00', '08:00:00'); -- Departure from Gate 4

-- Flight 16
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(1, 16, '07:30:00', '08:00:00'); -- Departure from Gate 1

-- Flight 17
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(4, 17, '07:30:00', '08:00:00'); -- Departure from Gate 4

-- Flight 18
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(1, 18, '07:30:00', '08:00:00'); -- Departure from Gate 1

-- Flight 19
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(4, 19, '07:30:00', '08:00:00'); -- Departure from Gate 4

-- Flight 20
INSERT INTO FlightGateSchedule (gate_id, flight_id, arrival_time, departure_time) VALUES
(1, 20, '07:30:00', '08:00:00'); -- Departure from Gate 1);


INSERT INTO Passenger (passenger_id, name, date_of_birth, passport_number, is_elite) VALUES
(1, 'John Smith', '1980-01-15', 'P00001', TRUE),
(2, 'Mary Johnson', '1990-02-20', 'P00002', FALSE),
(3, 'Robert Williams', '1975-03-25', 'P00003', FALSE),
(4, 'Patricia Brown', '1985-04-30', 'P00004', TRUE),
(5, 'Michael Jones', '1992-05-05', 'P00005', FALSE),
(6, 'Linda Davis', '1988-06-10', 'P00006', FALSE),
(7, 'William Miller', '1978-07-15', 'P00007', TRUE),
(8, 'Barbara Wilson', '1983-08-20', 'P00008', FALSE),
(9, 'James Moore', '1995-09-25', 'P00009', FALSE),
(10, 'Elizabeth Taylor', '1991-10-30', 'P00010', TRUE),
(11, 'Richard Anderson', '1984-11-05', 'P00011', FALSE),
(12, 'Susan Thomas', '1987-12-10', 'P00012', TRUE),
(13, 'Joseph Jackson', '1993-01-15', 'P00013', FALSE),
(14, 'Margaret White', '1982-02-20', 'P00014', FALSE),
(15, 'Charles Harris', '1979-03-25', 'P00015', TRUE),
(16, 'Dorothy Martin', '1994-04-30', 'P00016', FALSE),
(17, 'Christopher Thompson', '1986-05-05', 'P00017', FALSE),
(18, 'Karen Garcia', '1996-06-10', 'P00018', FALSE),
(19, 'Daniel Martinez', '1990-07-15', 'P00019', TRUE),
(20, 'Nancy Robinson', '1989-08-20', 'P00020', FALSE),
(21, 'Matthew Clark', '1991-09-25', 'P00021', FALSE),
(22, 'Lisa Rodriguez', '1983-10-30', 'P00022', TRUE),
(23, 'Anthony Lewis', '1992-11-05', 'P00023', FALSE),
(24, 'Betty Lee', '1987-12-10', 'P00024', FALSE),
(25, 'Mark Walker', '1985-01-15', 'P00025', TRUE),
(26, 'Sandra Hall', '1988-02-20', 'P00026', FALSE),
(27, 'Paul Allen', '1993-03-25', 'P00027', FALSE),
(28, 'Ashley Young', '1995-04-30', 'P00028', FALSE),
(29, 'Steven Hernandez', '1986-05-05', 'P00029', TRUE),
(30, 'Kimberly King', '1994-06-10', 'P00030', FALSE),
(31, 'Andrew Wright', '1990-07-15', 'P00031', FALSE),
(32, 'Donna Lopez', '1989-08-20', 'P00032', FALSE),
(33, 'Joshua Hill', '1982-09-25', 'P00033', TRUE),
(34, 'Michelle Scott', '1991-10-30', 'P00034', FALSE),
(35, 'Kevin Green', '1992-11-05', 'P00035', FALSE),
(36, 'Emily Adams', '1984-12-10', 'P00036', TRUE),
(37, 'Brian Baker', '1987-01-15', 'P00037', FALSE),
(38, 'Jessica Gonzalez', '1993-02-20', 'P00038', FALSE),
(39, 'Jason Nelson', '1995-03-25', 'P00039', FALSE),
(40, 'Sarah Carter', '1986-04-30', 'P00040', FALSE),
(41, 'Gary Mitchell', '1988-05-05', 'P00041', TRUE),
(42, 'Amanda Perez', '1994-06-10', 'P00042', FALSE),
(43, 'Timothy Roberts', '1990-07-15', 'P00043', FALSE),
(44, 'Melissa Turner', '1989-08-20', 'P00044', FALSE),
(45, 'George Phillips', '1985-09-25', 'P00045', TRUE),
(46, 'Stephanie Campbell', '1991-10-30', 'P00046', FALSE),
(47, 'Edward Parker', '1992-11-05', 'P00047', FALSE),
(48, 'Rebecca Evans', '1984-12-10', 'P00048', TRUE),
(49, 'Scott Edwards', '1987-01-15', 'P00049', FALSE),
(50, 'Laura Collins', '1993-02-20', 'P00050', FALSE),
(51, 'Eric Stewart', '1995-03-25', 'P00051', FALSE),
(52, 'Sharon Sanchez', '1986-04-30', 'P00052', FALSE),
(53, 'Stephen Morris', '1988-05-05', 'P00053', TRUE),
(54, 'Cynthia Rogers', '1994-06-10', 'P00054', FALSE),
(55, 'Larry Reed', '1990-07-15', 'P00055', FALSE),
(56, 'Angela Cook', '1989-08-20', 'P00056', FALSE),
(57, 'Jeffrey Morgan', '1985-09-25', 'P00057', TRUE),
(58, 'Katherine Bell', '1991-10-30', 'P00058', FALSE),
(59, 'Ryan Murphy', '1992-11-05', 'P00059', FALSE),
(60, 'Nicole Bailey', '1984-12-10', 'P00060', TRUE);


-- Passengers 1–12 (Citizens of Country A)
INSERT INTO Citizenship (passenger_id, country_id) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1),
(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1);

-- Passengers 13–24 (Citizens of Country B)
INSERT INTO Citizenship (passenger_id, country_id) VALUES
(13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2),
(19, 2), (20, 2), (21, 2), (22, 2), (23, 2), (24, 2);

-- Passengers 25–36 (Citizens of Country C)
INSERT INTO Citizenship (passenger_id, country_id) VALUES
(25, 3), (26, 3), (27, 3), (28, 3), (29, 3), (30, 3),
(31, 3), (32, 3), (33, 3), (34, 3), (35, 3), (36, 3);

-- Passengers 37–48 (Citizens of Country D)
INSERT INTO Citizenship (passenger_id, country_id) VALUES
(37, 4), (38, 4), (39, 4), (40, 4), (41, 4), (42, 4),
(43, 4), (44, 4), (45, 4), (46, 4), (47, 4), (48, 4);

-- Passengers 49–60 (Citizens of Country E)
INSERT INTO Citizenship (passenger_id, country_id) VALUES
(49, 5), (50, 5), (51, 5), (52, 5), (53, 5), (54, 5),
(55, 5), (56, 5), (57, 5), (58, 5), (59, 5), (60, 5);


-- Visas for Passengers from Country C to Country A
INSERT INTO Visa (visa_id, passenger_id, issuing_country_id, issuing_date, expiry_date) VALUES
(1, 25, 1, '2023-01-01', '2023-12-31'),
(2, 26, 1, '2023-01-01', '2023-12-31'),
(3, 27, 1, '2023-01-01', '2023-12-31');

-- Visas for Passengers from Country D to Country A
INSERT INTO Visa (visa_id, passenger_id, issuing_country_id, issuing_date, expiry_date) VALUES
(4, 37, 1, '2023-01-01', '2023-12-31'),
(5, 38, 1, '2023-01-01', '2023-12-31');

-- Visas for Passengers from Country E to Country A
INSERT INTO Visa (visa_id, passenger_id, issuing_country_id, issuing_date, expiry_date) VALUES
(6, 49, 1, '2023-01-01', '2023-12-31'),
(7, 50, 1, '2023-01-01', '2023-12-31');

-- Visas for Passengers from Country D to Country B
INSERT INTO Visa (visa_id, passenger_id, issuing_country_id, issuing_date, expiry_date) VALUES
(8, 39, 2, '2023-01-01', '2023-12-31'),
(9, 40, 2, '2023-01-01', '2023-12-31');

-- Visas for Passengers from Country E to Country B
INSERT INTO Visa (visa_id, passenger_id, issuing_country_id, issuing_date, expiry_date) VALUES
(10, 51, 2, '2023-01-01', '2023-12-31'),
(11, 52, 2, '2023-01-01', '2023-12-31');

-- Visas for Passengers from Country D to Country E
INSERT INTO Visa (visa_id, passenger_id, issuing_country_id, issuing_date, expiry_date) VALUES
(12, 41, 5, '2023-01-01', '2023-12-31'),
(13, 42, 5, '2023-01-01', '2023-12-31');

-- Visas for Passengers from Country E to Country D
INSERT INTO Visa (visa_id, passenger_id, issuing_country_id, issuing_date, expiry_date) VALUES
(14, 53, 4, '2023-01-01', '2023-12-31'),
(15, 54, 4, '2023-01-01', '2023-12-31');

-- Insert data into Zone
INSERT INTO Zone (zone_id, zone_number) VALUES
(1, 1),  -- Elite passengers
(2, 2),  -- Passengers with children under 6
(3, 3),  -- Regular passengers
(4, 4);  -- Standby passengers

-- Insert data into Booking
INSERT INTO Booking (booking_id, booking_date, is_stand_by) VALUES
(1, '2023-01-01 08:00:00', FALSE),  -- Booking with elite passengers
(2, '2023-01-02 09:00:00', FALSE),  -- Booking with children under 6
(3, '2023-01-03 10:00:00', TRUE),   -- Standby booking
(4, '2023-01-04 11:00:00', FALSE),  -- Regular booking
(5, '2023-01-05 12:00:00', FALSE);  -- Another regular booking

-- Seats for Flight 1 (flight_id = 1)
INSERT INTO Seat (seat_id, flight_id, number) VALUES
(1, 1, '1A'),
(2, 1, '1B'),
(3, 1, '1C'),
(4, 1, '1D'),
(5, 1, '1E'),
(6, 1, '1F'),
(7, 1, '2A'),
(8, 1, '2B');

-- Seats for Flight 2 (flight_id = 2)
INSERT INTO Seat (seat_id, flight_id, number) VALUES
(9, 2, '1A'),
(10, 2, '1B'),
(11, 2, '1C'),
(12, 2, '1D'),
(13, 2, '1E'),
(14, 2, '1F'),
(15, 2, '2A'),
(16, 2, '2B'),
(17, 2, '2C'),
(18, 2, '2D'),
(19, 2, '2E');
-- Seats for Flight 3 (flight_id = 3)
INSERT INTO Seat (seat_id, flight_id, number) VALUES
(20, 3, '1A'),
(21, 3, '1B'),
(22, 3, '1C');

-- Seats for Flight 5 (flight_id = 5)
INSERT INTO Seat (seat_id, flight_id, number) VALUES
(23, 5, '1A'),
(24, 5, '1B'),
(25, 5, '1C');

-- Seats for Flight 8 (flight_id = 8)
INSERT INTO Seat (seat_id, flight_id, number) VALUES
(26, 8, '1A'),
(27, 8, '1B'),
(28, 8, '1C');

-- Seats for Flight 9 (flight_id = 9)
INSERT INTO Seat (seat_id, flight_id, number) VALUES
(29, 9, '1A'),
(30, 9, '1B'),
(31, 9, '1C');

-- Seats for Flight 16 (flight_id = 16)
INSERT INTO Seat (seat_id, flight_id, number) VALUES
(32, 16, '1A'),
(33, 16, '1B'),
(34, 16, '1C');


-- Tickets for Elite Passengers
INSERT INTO Ticket (ticked_id, booking_id, passenger_id, flight_id, seat_id, route_id, zone_id) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 1, 4, 1, 2, 1, 1),
(3, 1, 7, 1, 3, 1, 1),
(4, 1, 10, 1, 4, 1, 1),
(5, 1, 15, 1, 5, 1, 1);

-- Tickets for Passengers with Children Under 6
INSERT INTO Ticket (ticked_id, booking_id, passenger_id, flight_id, seat_id, route_id, zone_id) VALUES
(6, 2, 2, 1, 7, 1, 2),
(7, 2, 3, 1, 8, 1, 2);

-- Tickets for Standby Passengers
INSERT INTO Ticket (ticked_id, booking_id, passenger_id, flight_id, seat_id, route_id, zone_id) VALUES
(8, 3, 5, NULL, NULL, 1, 4),
(9, 3, 6, NULL, NULL, 1, 4),
(10, 3, 8, NULL, NULL, 1, 4);

-- Tickets for Regular Passengers
INSERT INTO Ticket (ticked_id, booking_id, passenger_id, flight_id, seat_id, route_id, zone_id) VALUES
(11, 4, 9, 2, 13, 2, 3),
(12, 4, 11, 2, 14, 2, 3),
(13, 4, 12, 2, 15, 2, 3),
(14, 4, 13, 2, 16, 2, 3),
(15, 4, 14, 2, 17, 2, 3);

-- Tickets for Passenger 1 on Route 1 multiple times
INSERT INTO Ticket (ticked_id, booking_id, passenger_id, flight_id, seat_id, route_id, zone_id) VALUES
(16, 1, 1, 3, 18, 1, 1), -- Flight 3
(17, 1, 1, 5, 19, 1, 1), -- Flight 5
(18, 1, 1, 8, 20, 1, 1), -- Flight 8
(19, 1, 1, 9, 21, 1, 1), -- Flight 9
(20, 1, 1, 16, 22, 1, 1), -- Flight 16

-- Tickets for Passenger 4 on Route 1 multiple times
(21, 1, 4, 3, 23, 1, 1), -- Flight 3
(22, 1, 4, 5, 24, 1, 1), -- Flight 5
(23, 1, 4, 8, 25, 1, 1), -- Flight 8
(24, 1, 4, 9, 26, 1, 1), -- Flight 9
(25, 1, 4, 16, 27, 1, 1); -- Flight 16

-- Tickets for Passenger 2 on Route 2 multiple times
INSERT INTO Ticket (ticked_id, booking_id, passenger_id, flight_id, seat_id, route_id, zone_id) VALUES
(26, 2, 2, 4, NULL, 2, 2), -- Flight 4
(27, 2, 2, 6, NULL, 2, 2), -- Flight 6
(28, 2, 2, 10, NULL, 2, 2), -- Flight 10
(29, 2, 2, 17, NULL, 2, 2), -- Flight 17
(30, 2, 2, 19, NULL, 2, 2), -- Flight 19

-- Tickets for Passenger 3 on Route 2 multiple times
(31, 2, 3, 4, NULL, 2, 2), -- Flight 4
(32, 2, 3, 6, NULL, 2, 2), -- Flight 6
(33, 2, 3, 10, NULL, 2, 2), -- Flight 10
(34, 2, 3, 17, NULL, 2, 2), -- Flight 17
(35, 2, 3, 19, NULL, 2, 2); -- Flight 19

-- Tickets for Passengers 5 and 6 on Route 3 (standby)
INSERT INTO Ticket (ticked_id, booking_id, passenger_id, flight_id, seat_id, route_id, zone_id) VALUES
(36, 3, 5, NULL, NULL, 3, 4),
(37, 3, 6, NULL, NULL, 3, 4),
(38, 3, 5, NULL, NULL, 3, 4),
(39, 3, 6, NULL, NULL, 3, 4),
(40, 3, 5, NULL, NULL, 3, 4);

-- Tickets for Passengers 9 and 11 on Route 4
INSERT INTO Ticket (ticked_id, booking_id, passenger_id, flight_id, seat_id, route_id, zone_id) VALUES
(41, 4, 9, 11, NULL, 4, 3),
(42, 4, 11, 11, NULL, 4, 3),
(43, 4, 9, 12, NULL, 4, 3),
(44, 4, 11, 12, NULL, 4, 3),
(45, 4, 9, 13, NULL, 4, 3);

-- Tickets for Passengers 12 and 13 on Route 5
-- Luggage for Elite Passengers
INSERT INTO Luggage (luggage_id, passenger_id, weight) VALUES
(1, 1, 25.0),
(2, 1, 20.0),
(3, 1, 15.0),  -- Total: 60kg (within limit)

(4, 4, 30.0),
(5, 4, 25.0),
(6, 4, 20.0),
(7, 4, 15.0),  -- Total: 90kg (within limit)

(8, 7, 20.0),
(9, 7, 15.0),  -- Total: 35kg

(10, 10, 40.0),
(11, 10, 30.0),  -- Total: 70kg

(12, 15, 50.0),  -- Total: 50kg
(13, 15, 40.0),  -- Exceeds per-piece limit but allowed in total
(14, 15, 5.0);   -- Total: 95kg (within limit)

-- Luggage for Regular Passengers
INSERT INTO Luggage (luggage_id, passenger_id, weight) VALUES
(15, 2, 20.0),
(16, 2, 25.0),  
(17, 3, 15.0), 
(18, 5, 20.0),
(19, 5, 25.0),

(20, 6, 15.0),  -- Total: 15kg
(21, 8, 10.0),  -- Total: 10kg
(22, 9, 20.0),
(23, 9, 25.0),  -- Total: 45kg

(24, 11, 30.0),  -- Total: 30kg

(25, 12, 15.0),
(26, 12, 10.0),  -- Total: 25kg

(27, 13, 20.0),  -- Total: 20kg

(28, 14, 25.0),
(29, 14, 20.0);  -- Total: 45kg







