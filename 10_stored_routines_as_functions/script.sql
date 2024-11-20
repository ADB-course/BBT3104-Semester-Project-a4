-- Write your SQL code here
-- Function to calculate the total earnings by summing the AmountPaid from the Payment table
DELIMITER $$
CREATE FUNCTION CalculateTotalEarnings()
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE totalEarnings DECIMAL(10, 2);
    
    -- Calculate the total earnings by summing the AmountPaid from the Payment table
    SELECT SUM(AmountPaid) INTO totalEarnings
    FROM Payment;
    
    -- Return the total earnings
    RETURN totalEarnings;
END$$

DELIMITER ;

-- Function to count the number of bookings for a specific client
DELIMITER $$
CREATE FUNCTION GetClientBookingCount(ClientID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE bookingCount INT;
    
    SELECT COUNT(*) INTO bookingCount
    FROM BookingAndReservation
    WHERE ClientID = ClientID;
    
    -- Return the count of bookings
    RETURN bookingCount;
END$$

DELIMITER ;

