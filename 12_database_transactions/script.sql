-- Write your SQL code here
START TRANSACTION;
--Transaction 1: Booking a Room
-- Step 1: Insert a new booking record
INSERT INTO BookingAndReservation (DateOfBooking, ReservationLength, Cost, RoomID, ClientID)
VALUES ('2024-11-20', 3, 150.00, 1, 1001);  -- Example values: booking for Room 1 by Client 1001 for 3 days at a cost of 150.00

-- Step 2: Update the room's vacancy status to "Occupied"
UPDATE Rooms
SET Vacancy = FALSE
WHERE RoomID = 1;  -- Update the room to occupied

-- Step 3: Insert the client-room association in the ClientRoom table
INSERT INTO ClientRoom (ClientID, RoomID)
VALUES (1001, 1);  -- Associate Client 1001 with Room 1

-- Commit the transaction to apply changes
COMMIT;

--Transaction 2: Processing a Payment
START TRANSACTION;

-- Step 1: Insert a payment record for a client
INSERT INTO Payment (PaymentID, Facility, ClientID, DateOfTransaction, AmountPaid)
VALUES ('PMT123', 'Restaurant', 1001, '2024-11-20 15:00:00', 50.00);  -- Example values: payment of 50.00 for a restaurant bill

-- Step 2: Update the booking status to "Paid" or "Confirmed" (if applicable)
UPDATE BookingAndReservation
SET Cost = Cost - 50.00  -- Deduct the payment from the total booking cost (if this is a payment towards the room booking)
WHERE ClientID = 1001 AND RoomID = 1;  -- Assume the client made a payment for their booking

COMMIT;
