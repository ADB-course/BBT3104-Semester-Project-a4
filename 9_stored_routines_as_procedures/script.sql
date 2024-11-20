-- Write your SQL code here
-- Procedure to select detailed information about all employees
DELIMITER $$
CREATE PROCEDURE `GetEmployeeDetails`()
BEGIN
    SELECT EmployeeID, FullName, Role, Department, Salary
    FROM Employees;
END$$
DELIMITER ;

-- Procedure to select summary of all bookings
DELIMITER $$
CREATE PROCEDURE `GetBookingSummary`()
BEGIN
    SELECT 
        BookingID, 
        DateOfBooking, 
        RoomID, 
        ClientID, 
        ReservationLength
    FROM BookingAndReservation;
END$$

DELIMITER ;
