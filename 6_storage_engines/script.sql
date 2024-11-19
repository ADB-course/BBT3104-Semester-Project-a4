-- Write your SQL code here
-- Set the storage engine for Employees table
ALTER TABLE `Employees` ENGINE = InnoDB;

-- Set the storage engine for Rooms table
ALTER TABLE `Rooms` ENGINE = InnoDB;

-- Set the storage engine for Booking and Reservation table
ALTER TABLE `BookingAndReservation` ENGINE = InnoDB;

-- Set the storage engine for Client table
ALTER TABLE `Client` ENGINE = InnoDB;

-- Set the storage engine for Payment table
ALTER TABLE `Payment` ENGINE = InnoDB;

-- Set the storage engine for ClientRoom table
ALTER TABLE `ClientRoom` ENGINE = InnoDB;

-- Set the storage engine for Packages table
ALTER TABLE `Packages` ENGINE = InnoDB;
