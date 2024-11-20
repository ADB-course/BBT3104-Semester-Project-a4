-- Write your SQL code here
-- Create the Trigger for Automatic Booking Expiration
DELIMITER $$

CREATE TRIGGER `AutoBookingExpiration` 
AFTER UPDATE ON `BookingAndReservation`
FOR EACH ROW
BEGIN
    -- Check if the booking is pending payment (status = 'pending') and has exceeded the 24-hour limit
    IF NEW.DateOfBooking < NOW() - INTERVAL 24 HOUR AND NEW.Status = 'pending' THEN
        -- Update the booking status to 'expired'
        UPDATE `BookingAndReservation`
        SET `Status` = 'expired'
        WHERE `BookingID` = NEW.BookingID;
    END IF;
END $$

DELIMITER ;

-- Create the Trigger for Daily Room Status Review
DELIMITER $$

CREATE TRIGGER `DailyRoomStatusReview` 
AFTER UPDATE ON `BookingAndReservation`
FOR EACH ROW
BEGIN
    -- Check if the booking has ended and was not checked out yet
    IF NEW.DateOfBooking + INTERVAL NEW.ReservationLength DAY <= CURDATE() AND NEW.Status != 'checked_out' THEN
        -- Update the room's vacancy status to 'available'
        UPDATE `Rooms`
        SET `Vacancy` = TRUE
        WHERE `RoomID` = NEW.RoomID;
    END IF;
END $$

DELIMITER ;
