-- Check constraints for Employees table
ALTER TABLE `Employees`
ADD CONSTRAINT `chk_salary_positive` CHECK (`Salary` > 0);

-- Check constraints for Rooms table
ALTER TABLE `Rooms`
ADD CONSTRAINT `chk_vacancy_status` CHECK (`Vacancy` IN (TRUE, FALSE)),
ADD CONSTRAINT `chk_room_price_positive` CHECK (`RoomPrice` > 0);

-- Check constraints for Booking and Reservation table
ALTER TABLE `BookingAndReservation`
ADD CONSTRAINT `chk_booking_date_future` CHECK (`DateOfBooking` >= CURDATE()),
ADD CONSTRAINT `chk_reservation_length_positive` CHECK (`ReservationLength` > 0);

-- Check constraints for Client table
ALTER TABLE `Client`
ADD CONSTRAINT `chk_contact_info_format` CHECK (`ContactInfo` REGEXP '^[0-9]+$' OR `ContactInfo` LIKE '%_@__%.__%');

-- Check constraints for Payment table
ALTER TABLE `Payment`
ADD CONSTRAINT `chk_transaction_date_not_future` CHECK (`DateOfTransaction` <= CURRENT_TIMESTAMP),
ADD CONSTRAINT `chk_amount_paid_non_negative` CHECK (`AmountPaid` >= 0);

-- Check constraints for Packages table
ALTER TABLE `Packages`
ADD CONSTRAINT `chk_package_name_not_empty` CHECK (`PackageName` != '');
