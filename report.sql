WITH
    reservationsWithSpecialNames AS
(
    SELECT * FROM "tempResLoad" WHERE "Name" ILIKE '%*%'
),
    reservationsWithNights AS
(
    SELECT *, "CheckOutDate" - "CheckInDate" AS "Nights" FROM "tempResLoad"
),
     reservationsCheckedOut AS
(
    SELECT * FROM reservationsWithNights WHERE "Status" = 'O'
),
    reservationsCheckedIn AS
(
    SELECT * FROM reservationsWithNights WHERE "Status" = 'I'
),
   reservationsCheckedOutFuture AS
(
    SELECT * FROM reservationsCheckedOut WHERE "CheckOutDate" > '2019-12-31'
)
SELECT 'Reservations Checked Out Next Year(2020)' AS "Description", COUNT(*) AS "Count" FROM reservationsCheckedOutFuture
UNION
SELECT 'Reservations With Special Characters in Name' AS "Description", COUNT(*) AS "Count" FROM reservationsWithSpecialNames
UNION
SELECT 'Reservations with extremely long stays (>500 days)' AS "Description", COUNT(*) AS "Count" FROM reservationsCheckedOut WHERE "Nights" > 500;
