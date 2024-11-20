-- Write your SQL code here
-- Create the Employees table
CREATE TABLE `Employees` (
    `EmployeeID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- EmployeeID is unique and auto-incremented
    `FullName` VARCHAR(100) NOT NULL, -- Full name cannot be NULL
    `Salary` DECIMAL(10, 2) NOT NULL, -- Salary field
    `Role` VARCHAR(50) NOT NULL, -- Role field cannot be NULL
    `Department` VARCHAR(50) NOT NULL -- Department field cannot be NULL
) 
-- Create the Client table
CREATE TABLE `Client` (
    `ClientID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- ClientID is unique and auto-incremented
    `FullName` VARCHAR(100) NOT NULL, -- Client's full name (cannot be NULL)
    `ContactInfo` VARCHAR(255) UNIQUE -- Contact info (phone number, email, etc.) is unique
) 

-- Create the Rooms table
CREATE TABLE `Rooms` (
    `RoomID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- RoomID is unique and auto-incremented
    `Vacancy` BOOLEAN NOT NULL, -- Vacancy status (TRUE or FALSE)
    `ClientID` INT UNSIGNED, -- Foreign Key to Client table
    `RoomPrice` DECIMAL(10, 2) NOT NULL, -- Room price
    FOREIGN KEY (`ClientID`) REFERENCES `Client`(`ClientID`) -- Reference to Client table
) 

-- Create the BookingAndReservation table
CREATE TABLE `BookingAndReservation` (
    `BookingID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- BookingID is unique and auto-incremented
    `DateOfBooking` DATE NOT NULL, -- Date of booking
    `ReservationLength` INT NOT NULL, -- Reservation length (positive integer)
    `Cost` DECIMAL(10, 2) NOT NULL, -- Cost for the reservation
    `RoomID` INT UNSIGNED, -- Foreign Key to Rooms table
    `ClientID` INT UNSIGNED, -- Foreign Key to Client table
    FOREIGN KEY (`RoomID`) REFERENCES `Rooms`(`RoomID`), -- Reference to Rooms table
    FOREIGN KEY (`ClientID`) REFERENCES `Client`(`ClientID`) -- Reference to Client table
) 

-- Create the Payment table
CREATE TABLE `Payment` (
    `PaymentID` VARCHAR(10) NOT NULL PRIMARY KEY, -- PaymentID is unique and auto-incremented
    `Facility` VARCHAR(50) NOT NULL, -- Name of the facility (e.g., restaurant, bar)
    `ClientID` INT UNSIGNED, -- Foreign Key to Client table
    `DateOfTransaction` TIMESTAMP NOT NULL, -- Date and time of transaction
    `AmountPaid` DECIMAL(10, 2) NOT NULL, -- Amount paid
    FOREIGN KEY (`ClientID`) REFERENCES `Client`(`ClientID`) -- Reference to Client table
) 

-- Create the ClientRoom table 
CREATE TABLE `ClientRoom` (
    `ClientID` INT UNSIGNED, -- Foreign Key to Client table
    `RoomID` INT UNSIGNED, -- Foreign Key to Rooms table
    FOREIGN KEY (`ClientID`) REFERENCES `Client`(`ClientID`), -- Reference to Client table
    FOREIGN KEY (`RoomID`) REFERENCES `Rooms`(`RoomID`) -- Reference to Rooms table
) 

-- Create Packages table with necessary constraints and index
CREATE TABLE `Packages` (
    `ClientID` INT UNSIGNED, -- The ClientID to link the package to a client
    `PackageName` VARCHAR(100) NOT NULL, -- The name of the package (e.g., "Spa", "Breakfast")
    FOREIGN KEY (`ClientID`) REFERENCES `Client`(`ClientID`), -- Ensure that the ClientID references a valid client
    PRIMARY KEY (`ClientID`, `PackageName`) -- A unique constraint to prevent duplicate entries for the same client and package
) 