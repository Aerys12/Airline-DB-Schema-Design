WITH CrewPlaneWork AS (
    -- Flight Crew Assignments
    SELECT
        cm.airline_id,
        cm.crew_id,
        f.plane_id,
        COUNT(*) AS times_worked
    FROM
        FlightCrewAssigment fca
    INNER JOIN Flight f ON fca.flight_id = f.flight_id
    INNER JOIN CrewMember cm ON fca.crew_id = cm.crew_id
    WHERE
        EXTRACT(YEAR FROM f.departure_date) = 2023
    GROUP BY
        cm.airline_id,
        cm.crew_id,
        f.plane_id

    UNION ALL

    -- Ground Crew Assignments
    SELECT
        cm.airline_id,
        cm.crew_id,
        f.plane_id,
        COUNT(*) AS times_worked
    FROM
        GroundCrewAssignment gca
    INNER JOIN Flight f ON gca.flight_id = f.flight_id
    INNER JOIN CrewMember cm ON gca.crew_id = cm.crew_id
    WHERE
        EXTRACT(YEAR FROM f.departure_date) = 2023
    GROUP BY
        cm.airline_id,
        cm.crew_id,
        f.plane_id
),

AggregatedCrewPlaneWork AS (
    SELECT
        cw.airline_id,
        cw.crew_id,
        cw.plane_id,
        SUM(cw.times_worked) AS total_times_worked
    FROM
        CrewPlaneWork cw
    GROUP BY
        cw.airline_id,
        cw.crew_id,
        cw.plane_id
)

SELECT
    a.name AS airline_name,
    cm.name AS crew_member_name,
    p.name AS plane_name,
    acpw.total_times_worked
FROM
    AggregatedCrewPlaneWork acpw
INNER JOIN Airline a ON acpw.airline_id = a.airline_id
INNER JOIN CrewMember cm ON acpw.crew_id = cm.crew_id
INNER JOIN Plane p ON acpw.plane_id = p.plane_id
WHERE
    acpw.total_times_worked >= 10
ORDER BY
    a.name,
    cm.name,
    p.name;

