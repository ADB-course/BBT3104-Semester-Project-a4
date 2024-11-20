-- Write your SQL code here
-- Start the transaction
START TRANSACTION;

-- Step 1: Insert a new client record into the Client table (this is just for the example; skip if the client already exists)
-- Here we are using ClientID = 4 to represent a new client in the scenario
INSERT INTO Client (FullName, ContactInfo)
VALUES ('John Smith', 'john.smith@email.com');  -- Example client information

-- Step 2: Get the last inserted ClientID (to use in the next steps)
SET @ClientID = LAST_INSERT_ID();  -- Dynamically capture the ClientID of the newly inserted client

-- Step 3: Insert a new booking record into the BookingAndReservation table
INSERT INTO BookingAndReservation (DateOfBooking, ReservationLength, Cost, RoomID, ClientID)
VALUES ('2024-11-21', 2, 300.00, 101, @ClientID);  -- Booking for Room 101 by newly created client for 2 days at 300.00

-- Step 4: Update the room's vacancy status to "Occupied" in the Rooms table
UPDATE Rooms
SET Vacancy = FALSE
WHERE RoomID = 101;  -- Mark RoomID 101 as occupied

-- Step 5: Insert the client-room association in the ClientRoom table
INSERT INTO ClientRoom (ClientID, RoomID)
VALUES (@ClientID, 101);  -- Associate the dynamically inserted ClientID with RoomID 101

-- Commit the transaction to apply all changes
COMMIT;


-- Transaction 2: Processing a Payment
START TRANSACTION;

-- Step 1: Insert a payment record for a client (using an existing client, e.g., ClientID 1)
INSERT INTO Payment (PaymentID, Facility, ClientID, DateOfTransaction, AmountPaid)
VALUES ('P004', 'Restaurant', 1, '2024-11-19 12:30:00', 50.00);  -- Example: Client 1 makes a payment of 50.00 for the restaurant

-- Step 2: Update the booking status to "Paid" or "Confirmed"
-- Here, we assume the client has paid part of their booking cost.
UPDATE BookingAndReservation
SET Cost = Cost - 50.00  -- Deduct the payment from the total booking cost
WHERE ClientID = 1 AND RoomID = 102;  -- Client 1 made a payment for their booking in Room 102

-- Commit the transaction to apply all changes
COMMIT;

