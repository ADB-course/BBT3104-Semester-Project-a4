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

-- Trigger to log client booking history into the Payment table whenever a new booking is made
CREATE TRIGGER log_client_booking_to_payment
AFTER INSERT ON BookingAndReservation
FOR EACH ROW
BEGIN
    -- Insert a new record into the Payment table
    INSERT INTO Payment (`Facility`, `ClientID`, `DateOfTransaction`, `AmountPaid`)
    VALUES ('Booking Payment', NEW.ClientID, NEW.DateOfBooking, NEW.Cost);
END;

-- Trigger ensure that DateOfBooking is greater than or equal to the current date
DELIMITER //

CREATE TRIGGER validate_booking_date
BEFORE INSERT ON `BookingAndReservation`
FOR EACH ROW
BEGIN
    IF NEW.DateOfBooking < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'DateOfBooking must be today or in the future';
    END IF;

    IF NEW.ReservationLength <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ReservationLength must be greater than 0';
    END IF;
END;
//

DELIMITER ;

-- Trigger to ensure that DateOfTransaction is not in the future
DELIMITER //

CREATE TRIGGER `chk_transaction_date_not_future`
BEFORE INSERT ON `Payment`
FOR EACH ROW
BEGIN
    IF NEW.DateOfTransaction > NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of transaction cannot be in the future';
    END IF;
END;
//

DELIMITER ;
