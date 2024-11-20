-- Write your SQL code here
-- Indexes for Employees table
CREATE INDEX idx_role ON `Employees` (`Role`);

CREATE INDEX idx_department ON `Employees` (`Department`);

-- Indexes for Rooms table
CREATE INDEX idx_vacancy ON `Rooms` (`Vacancy`);

CREATE INDEX idx_client_id ON `Rooms` (`ClientID`);

-- Indexes for Booking and Reservation table
CREATE INDEX idx_booking_date ON `BookingAndReservation` (`DateOfBooking`);

CREATE INDEX idx_room_id ON `BookingAndReservation` (`RoomID`);

CREATE INDEX idx_client_id ON `BookingAndReservation` (`ClientID`);

-- Index for Client table
CREATE UNIQUE INDEX idx_contact_info ON `Client` (`ContactInfo`);

-- Indexes for Payment table
CREATE INDEX idx_transaction_date ON `Payment` (`DateOfTransaction`);

CREATE INDEX idx_client_id ON `Payment` (`ClientID`);

-- Indexes for ClientRoom table
CREATE INDEX idx_client_id ON `ClientRoom` (`ClientID`);

CREATE INDEX idx_room_id ON `ClientRoom` (`RoomID`);

-- Index for Packages table
CREATE INDEX idx_client_id ON `Packages` (`ClientID`);