-- Write your SQL code here
-- Trigger to automatically update the room status to 'occupied' when a new booking is made
CREATE TRIGGER update_room_status_on_booking
AFTER INSERT ON `BookingAndReservation`
FOR EACH ROW
BEGIN
    -- Update the room status to 'occupied' in the Rooms table
    UPDATE `Rooms`
    SET `Vacancy` = FALSE
    WHERE `RoomID` = NEW.RoomID;
END;

-- Trigger to log client booking history whenever a new booking is made
CREATE TRIGGER log_client_booking_history
AFTER INSERT ON `BookingAndReservation`
FOR EACH ROW
BEGIN
    -- Insert a new record into the ClientBookingHistory table
    INSERT INTO `ClientBookingHistory` (`ClientID`, `BookingID`, `DateOfBooking`, `RoomID`, `ReservationLength`)
    VALUES (NEW.ClientID, NEW.BookingID, NEW.DateOfBooking, NEW.RoomID, NEW.ReservationLength);
END;
