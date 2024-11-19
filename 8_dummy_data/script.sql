-- Write your SQL code here
--Dummy data for Employees table
INSERT INTO `Employees` (`EmployeeID`, `FullName`, `Salary`, `Role`, `Department`)
VALUES
(1, 'John Doe', 50000.00, 'Manager', 'Operations'),
(2, 'Jane Smith', 35000.00, 'Waiter', 'Food and Beverage'),
(3, 'Alice Brown', 45000.00, 'Housekeeping Supervisor', 'Housekeeping');

--Dummy data for Rooms table
INSERT INTO `Rooms` (`RoomID`, `Vacancy`, `ClientID`, `RoomPrice`)
VALUES
(101, TRUE, NULL, 150.00),
(102, FALSE, 1, 200.00),
(103, TRUE, NULL, 120.00);

--Dummy data for BookingAndReservation table
INSERT INTO `BookingAndReservation` (`BookingID`, `DateOfBooking`, `ReservationLength`, `Cost`, `RoomID`, `ClientID`)
VALUES
(1, '2024-11-19', 3, 450.00, 101, 2),
(2, '2024-11-18', 2, 400.00, 102, 1),
(3, '2024-11-20', 1, 120.00, 103, 3);

--Dummy data for Client table
INSERT INTO `Client` (`ClientID`, `FullName`, `ContactInfo`)
VALUES
(1, 'Michael Johnson', 'michael.johnson@email.com'),
(2, 'Sarah Williams', 'sarah.williams@email.com'),
(3, 'David Miller', 'david.miller@email.com');

--Dummy data for the Packages table
INSERT INTO `Packages` (`ClientID`, `PackageName`)
VALUES
(1, 'Breakfast Package'),
(2, 'Full Board Package'),
(3, 'Spa Package');

--Dummy data for the Payment table
INSERT INTO `Payment` (`PaymentID`, `Facility`, `ClientID`, `DateOfTransaction`, `AmountPaid`)
VALUES
('P001', 'Restaurant', 1, '2024-11-19 12:00:00', 50.00),
('P002', 'Bar', 2, '2024-11-19 13:30:00', 30.00),
('P003', 'Room Service', 3, '2024-11-19 15:00:00', 60.00);

--Dummy data for the ClientRoom table
INSERT INTO `ClientRoom` (`ClientID`, `RoomID`)
VALUES
(1, 102),
(2, 101),
(3, 103);
