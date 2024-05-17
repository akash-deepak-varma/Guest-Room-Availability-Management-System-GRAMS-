--To get a list of available rooms:
SELECT Room.RoomNo, RoomType.TypeName, Room.AvailabilityStatus
FROM Room
INNER JOIN RoomType ON Room.TypeID = RoomType.TypeID
WHERE Room.AvailabilityStatus = 'Available';


--To get a list of occupied rooms:
SELECT Room.RoomNo, RoomType.TypeName, Room.AvailabilityStatus
FROM Room
INNER JOIN RoomType ON Room.TypeID = RoomType.TypeID
WHERE Room.AvailabilityStatus = 'Occupied';


--To search for reservations by guest name or date range:
-- Search by guest name
SELECT Reservation.CheckINDate, Reservation.CheckOUTDate, Room.RoomNo, Guest.GuestName
FROM Reservation
INNER JOIN Guest ON Reservation.GuestID = Guest.GuestID
INNER JOIN Room ON Reservation.RoomID = Room.RoomNo
WHERE Guest.GuestName LIKE '%searchterm%';

-- Search by date range
SELECT Reservation.CheckINDate, Reservation.CheckOUTDate, Room.RoomNo, Guest.GuestName
FROM Reservation
INNER JOIN Guest ON Reservation.GuestID = Guest.GuestID
INNER JOIN Room ON Reservation.RoomID = Room.RoomNo
WHERE Reservation.CheckINDate BETWEEN 'start_date' AND 'end_date'
   OR Reservation.CheckOUTDate BETWEEN 'start_date' AND 'end_date';


--To check login credentials for users:
SELECT UserName, PasswordHash, Role
FROM User
WHERE UserName = 'username' AND PasswordHash = 'password_hash';
