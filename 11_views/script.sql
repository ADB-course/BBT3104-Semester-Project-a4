-- Write your SQL code here
-- view to provide guests with detailed information about available rooms, their prices, and the current vacancy status
CREATE VIEW GuestRoomInfo AS
SELECT 
    r.RoomID, 
    r.RoomPrice, 
    r.Vacancy, 
    CASE 
        WHEN r.Vacancy = TRUE THEN 'Available' 
        ELSE 'Occupied' 
    END AS RoomStatus
FROM 
    Rooms r
WHERE 
    r.Vacancy = TRUE;

-- view to provide a financial summary, displaying payments made, associated facilities (like restaurant, bar, etc.), and transaction dates
CREATE VIEW FinancialReport AS
SELECT 
    p.PaymentID, 
    p.Facility, 
    p.AmountPaid, 
    p.DateOfTransaction, 
    c.FullName AS ClientName
FROM 
    Payment p
JOIN 
    Client c ON p.ClientID = c.ClientID
ORDER BY 
    p.DateOfTransaction DESC;
