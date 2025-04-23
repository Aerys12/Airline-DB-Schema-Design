WITH route_flight_passengers AS (
    -- Get passengers on each flight along with route and flight information
    SELECT
        r.route_id,
        f.flight_id,
        COUNT(DISTINCT t.passenger_id) AS total_passengers,
        SUM(
            CASE
                WHEN vr.requires_visa THEN 1
                ELSE 0
            END
        ) AS passengers_requiring_visa
    FROM
        Route r
    INNER JOIN Flight f ON r.route_id = f.route_id
    INNER JOIN Ticket t ON f.flight_id = t.flight_id
    INNER JOIN Passenger p ON t.passenger_id = p.passenger_id
    LEFT JOIN (
        -- Determine if the passenger requires a visa for the destination country
        SELECT
            p.passenger_id,
            r.route_id,
            CASE
                WHEN c.country_id <> dest.country_id
                     AND NOT EXISTS (
                        SELECT 1
                        FROM Citizenship ci
                        WHERE ci.passenger_id = p.passenger_id
                          AND ci.country_id = dest.country_id
                    )
                     AND (
                        (dest.country_id = 1 AND c.country_id IN (3, 4, 5))
                        OR (dest.country_id = 2 AND c.country_id IN (4, 5))
                        OR (dest.country_id = 4 AND c.country_id = 5)
                        OR (dest.country_id = 5 AND c.country_id = 4)
                    )
                THEN TRUE
                ELSE FALSE
            END AS requires_visa
        FROM
            Ticket t
        INNER JOIN Flight f ON t.flight_id = f.flight_id
        INNER JOIN Route r ON f.route_id = r.route_id
        INNER JOIN Passenger p ON t.passenger_id = p.passenger_id
        INNER JOIN Citizenship ci ON p.passenger_id = ci.passenger_id
        INNER JOIN Country c ON ci.country_id = c.country_id
        INNER JOIN Airport dest ON r.destination_airport_id = dest.airport_id
        WHERE
            EXTRACT(YEAR FROM f.departure_date) = 2023
    ) vr ON t.passenger_id = vr.passenger_id AND r.route_id = vr.route_id
    WHERE
        EXTRACT(YEAR FROM f.departure_date) = 2023
        AND r.international = TRUE
    GROUP BY
        r.route_id,
        f.flight_id
),
route_average_visa AS (
    -- Calculate the average number of passengers requiring visas per route
    SELECT
        route_id,
        AVG(passengers_requiring_visa::NUMERIC) AS avg_passengers_requiring_visa
    FROM
        route_flight_passengers
    GROUP BY
        route_id
),
overall_average AS (
    -- Calculate the overall average number of passengers requiring visas across all international routes
    SELECT
        AVG(avg_passengers_requiring_visa) AS overall_avg_visa
    FROM
        route_average_visa
)
SELECT
    r.route_id,
    a1.name AS origin_airport,
    a2.name AS destination_airport,
    ra.avg_passengers_requiring_visa
FROM
    route_average_visa ra
INNER JOIN overall_average oa ON TRUE
INNER JOIN Route r ON ra.route_id = r.route_id
INNER JOIN Airport a1 ON r.origin_airport_id = a1.airport_id
INNER JOIN Airport a2 ON r.destination_airport_id = a2.airport_id
WHERE
    ra.avg_passengers_requiring_visa < (0.25 * oa.overall_avg_visa)
    AND ra.avg_passengers_requiring_visa > 0
ORDER BY
    ra.avg_passengers_requiring_visa ASC

