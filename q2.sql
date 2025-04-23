WITH trip_counts AS (
    SELECT
        t.passenger_id,
        t.route_id,
        COUNT(*) AS trip_count
    FROM
        Ticket t
    INNER JOIN Flight f ON t.flight_id = f.flight_id
    WHERE
        EXTRACT(YEAR FROM f.departure_date) = 2023
    GROUP BY
        t.passenger_id,
        t.route_id
),
max_trip_counts AS (
    SELECT
        route_id,
        MAX(trip_count) AS max_trip_count
    FROM
        trip_counts
    GROUP BY
        route_id
)
SELECT
    p.name AS passenger_name,
    r.route_id,
    a1.name AS origin_airport,
    a2.name AS destination_airport,
    tc.trip_count
FROM
    trip_counts tc
INNER JOIN max_trip_counts mtc ON
    tc.route_id = mtc.route_id AND
    tc.trip_count = mtc.max_trip_count
INNER JOIN Passenger p ON
    tc.passenger_id = p.passenger_id
INNER JOIN Route r ON
    tc.route_id = r.route_id
INNER JOIN Airport a1 ON
    r.origin_airport_id = a1.airport_id
INNER JOIN Airport a2 ON
    r.destination_airport_id = a2.airport_id
ORDER BY
    r.route_id,
    p.name;

