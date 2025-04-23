
SELECT
    a.name AS airport_name,
    COUNT(DISTINCT p.passenger_id) AS total_passengers
FROM
    Airport a
LEFT JOIN (
    -- Passengers departing from the airport
    SELECT
        r.origin_airport_id AS airport_id,
        t.passenger_id
    FROM
        Flight f
    INNER JOIN Route r ON f.route_id = r.route_id
    INNER JOIN Ticket t ON f.flight_id = t.flight_id
    WHERE
        EXTRACT(YEAR FROM f.departure_date) = 2023

    UNION ALL

    -- Passengers arriving at the airport
    SELECT
        r.destination_airport_id AS airport_id,
        t.passenger_id
    FROM
        Flight f
    INNER JOIN Route r ON f.route_id = r.route_id
    INNER JOIN Ticket t ON f.flight_id = t.flight_id
    WHERE
        EXTRACT(YEAR FROM f.arrival_date) = 2023
) p ON a.airport_id = p.airport_id
GROUP BY
    a.airport_id, a.name
ORDER BY
    total_passengers DESC;

