-- User table
CREATE TABLE User (
    UserID VARCHAR(50) PRIMARY KEY,
    UserName VARCHAR(255),
    Email VARCHAR(255),
    PasswordHash VARCHAR(255),
    Role VARCHAR(50)
);

-- Room table
CREATE TABLE Room (
    RoomNo INT PRIMARY KEY,
    HostelName VARCHAR(255),
    AvailabilityStatus VARCHAR(50),
    TypeID VARCHAR(50),
    UserID VARCHAR(50)
);

-- RoomType table
CREATE TABLE RoomType (
    TypeID VARCHAR(50) PRIMARY KEY,
    TypeName VARCHAR(255),
    Capacity INT,
    Price DECIMAL(10, 2),
    Image BLOB,
    Description TEXT
);

-- Guest table
CREATE TABLE Guest (
    GuestID VARCHAR(50) PRIMARY KEY,
    GuestName VARCHAR(255),
    GuestSSN VARCHAR(50),
    PhoneNo VARCHAR(20),
    UserID VARCHAR(50)
);

-- Reservation table
CREATE TABLE Reservation (
    GuestID VARCHAR(50),
    RoomID INT,
    BillingID VARCHAR(50),
    CheckINDate DATE,
    CheckINTime TIME,
    CheckOUTDate DATE,
    CheckOUTTime TIME,
    ReservationStatus VARCHAR(50)
);

-- Billing table
CREATE TABLE Billing (
    BillingID VARCHAR(50) PRIMARY KEY,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR(50),
    GuestID VARCHAR(50)
);

-- Payment table
CREATE TABLE Payment (
    PaymentID VARCHAR(50) PRIMARY KEY,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    BillingID VARCHAR(50)
);

-- RoomBookingLog table
CREATE TABLE RoomBookingLog (
    BookingLogID VARCHAR(50) PRIMARY KEY,
    BookingDate DATE,
    NumberOfRooms INT,
    PaymentID VARCHAR(50)
);

-- Cancellation table
CREATE TABLE Cancellation (
    CancellationID VARCHAR(50) PRIMARY KEY,
    PaymentID VARCHAR(50),
    CancellationStatus VARCHAR(50),
    RefundStatus VARCHAR(50)
);

-- Feedback table
CREATE TABLE Feedback (
    FeedbackID VARCHAR(50) PRIMARY KEY,
    FeedbackType VARCHAR(50),
    Rating INT,
    Description TEXT,
    CancellationID VARCHAR(50),
    PaymentID VARCHAR(50)
);

-- RoomType table
INSERT INTO RoomType (TypeID, TypeName, Capacity, Price, Description)
VALUES 
('DOUBLE', 'Double Room', 2, 200.00, 'A double occupancy room.'),
('SINGLE', 'Single Room', 1, 200.00, 'A single occupancy room.'),
('COMMON', 'Common Room', 5, 200.00, 'A common area for all guests.'),
('VIP', 'VIP Room', 3, 1100.00, 'A luxurious VIP room.'),
('NON_AC', 'Non-AC Room', 1, 450.00, 'A single occupancy non-AC room.'),
('AC', 'AC Room', 1, 750.00, 'A single occupancy AC room.');


-- Room table
INSERT INTO Room (RoomNo, HostelName, AvailabilityStatus, TypeID, UserID)
VALUES 
-- Lotus
-- Double Rooms
(1, 'Lotus', 'Available', 'DOUBLE', NULL),
(2, 'Lotus', 'Available', 'DOUBLE', NULL),
(3, 'Lotus', 'Available', 'DOUBLE', NULL),
(4, 'Lotus', 'Available', 'DOUBLE', NULL),
(5, 'Lotus', 'Available', 'DOUBLE', NULL),
(6, 'Lotus', 'Available', 'DOUBLE', NULL),
(7, 'Lotus', 'Available', 'DOUBLE', NULL),
(8, 'Lotus', 'Available', 'DOUBLE', NULL),
(9, 'Lotus', 'Available', 'DOUBLE', NULL),
(10, 'Lotus', 'Available', 'DOUBLE', NULL),
-- Single Rooms
(11, 'Lotus', 'Available', 'SINGLE', NULL),
(12, 'Lotus', 'Available', 'SINGLE', NULL),
(13, 'Lotus', 'Available', 'SINGLE', NULL),
(14, 'Lotus', 'Available', 'SINGLE', NULL),
(15, 'Lotus', 'Available', 'SINGLE', NULL),
(16, 'Lotus', 'Available', 'SINGLE', NULL),
(17, 'Lotus', 'Available', 'SINGLE', NULL),
(18, 'Lotus', 'Available', 'SINGLE', NULL),
(19, 'Lotus', 'Available', 'SINGLE', NULL),
(20, 'Lotus', 'Available', 'SINGLE', NULL),
-- Common Room
(21, 'Lotus', 'Available', 'COMMON', NULL),

-- Banyan
-- Double Rooms
(22, 'Banyan', 'Available', 'DOUBLE', NULL),
(23, 'Banyan', 'Available', 'DOUBLE', NULL),
(24, 'Banyan', 'Available', 'DOUBLE', NULL),
(25, 'Banyan', 'Available', 'DOUBLE', NULL),
(26, 'Banyan', 'Available', 'DOUBLE', NULL),
(27, 'Banyan', 'Available', 'DOUBLE', NULL),
(28, 'Banyan', 'Available', 'DOUBLE', NULL),
(29, 'Banyan', 'Available', 'DOUBLE', NULL),
(30, 'Banyan', 'Available', 'DOUBLE', NULL),
(31, 'Banyan', 'Available', 'DOUBLE', NULL),
-- Single Rooms
(32, 'Banyan', 'Available', 'SINGLE', NULL),
(33, 'Banyan', 'Available', 'SINGLE', NULL),
(34, 'Banyan', 'Available', 'SINGLE', NULL),
(35, 'Banyan', 'Available', 'SINGLE', NULL),
(36, 'Banyan', 'Available', 'SINGLE', NULL),
(37, 'Banyan', 'Available', 'SINGLE', NULL),
(38, 'Banyan', 'Available', 'SINGLE', NULL),
(39, 'Banyan', 'Available', 'SINGLE', NULL),
(40, 'Banyan', 'Available', 'SINGLE', NULL),
(41, 'Banyan', 'Available', 'SINGLE', NULL),
-- Common Room
(42, 'Banyan', 'Available', 'COMMON', NULL),

-- Ashwatha
-- VIP Rooms
(43, 'Ashwatha', 'Available', 'VIP', NULL),
(44, 'Ashwatha', 'Available', 'VIP', NULL),
(45, 'Ashwatha', 'Available', 'VIP', NULL),
(46, 'Ashwatha', 'Available', 'VIP', NULL),
(47, 'Ashwatha', 'Available', 'VIP', NULL),
(48, 'Ashwatha', 'Available', 'VIP', NULL),
(49, 'Ashwatha', 'Available', 'VIP', NULL),
(50, 'Ashwatha', 'Available', 'VIP', NULL),
(51, 'Ashwatha', 'Available', 'VIP', NULL),
(52, 'Ashwatha', 'Available', 'VIP', NULL),
-- Non-AC Rooms
(53, 'Ashwatha', 'Available', 'NON_AC', NULL),
(54, 'Ashwatha', 'Available', 'NON_AC', NULL),
(55, 'Ashwatha', 'Available', 'NON_AC', NULL),
(56, 'Ashwatha', 'Available', 'NON_AC', NULL),
(57, 'Ashwatha', 'Available', 'NON_AC', NULL),
(58, 'Ashwatha', 'Available', 'NON_AC', NULL),
(59, 'Ashwatha', 'Available', 'NON_AC', NULL),
(60, 'Ashwatha', 'Available', 'NON_AC', NULL),
(61, 'Ashwatha', 'Available', 'NON_AC', NULL),
-- AC Rooms
(62, 'Ashwatha', 'Available', 'AC', NULL),
(63, 'Ashwatha', 'Available', 'AC', NULL),
(64, 'Ashwatha', 'Available', 'AC', NULL),
(65, 'Ashwatha', 'Available', 'AC', NULL),
(66, 'Ashwatha', 'Available', 'AC', NULL),
(67, 'Ashwatha', 'Available', 'AC', NULL),
(68, 'Ashwatha', 'Available', 'AC', NULL),
(69, 'Ashwatha', 'Available', 'AC', NULL),
(70, 'Ashwatha', 'Available', 'AC', NULL);


-- Guest table
INSERT INTO Guest (GuestID, GuestName, GuestSSN, PhoneNo, UserID)
VALUES 
('G1', 'Alice', '123456789', '1234567890', NULL),  -- Female guest in Lotus, Double Room
('G2', 'Bob', '987654321', '9876543210', NULL),    -- Male guest in Banyan, Single Room
('G3', 'Charlie', '456789123', '4567891230', NULL),-- Female guest in Lotus, Single Room
('G4', 'David', '654321789', '6543217890', NULL),  -- Male guest in Banyan, Double Room
('G5', 'Eve', '987123654', '9871236540', NULL),    -- Female guest in Ashwatha, VIP Room
('G6', 'Frank', '321654987', '3216549870', NULL),  -- Male guest in Ashwatha, Non-AC Room
('G7', 'Grace', '159357486', '1593574860', NULL),  -- Female guest in Lotus, Common Room
('G8', 'Harry', '357159486', '3571594860', NULL),  -- Male guest in Banyan, Common Room
('G9', 'Ivy', '258369147', '2583691470', NULL),    -- Female guest in Ashwatha, AC Room
('G10', 'Jack', '369258147', '3692581470', NULL);  -- Male guest in Ashwatha, AC Room

-- Reservation table
INSERT INTO Reservation (GuestID, RoomID, BillingID, CheckINDate, CheckINTime, CheckOUTDate, CheckOUTTime, ReservationStatus)
VALUES 
('G1', 1, NULL, '2024-05-01', '12:00:00', '2024-05-10', '12:00:00', 'Confirmed'), -- Reservation for Alice in Lotus, Double Room
('G2', 32, NULL, '2024-05-05', '12:00:00', '2024-05-15', '12:00:00', 'Confirmed'), -- Reservation for Bob in Banyan, Single Room
('G3', 11, NULL, '2024-05-10', '12:00:00', '2024-05-20', '12:00:00', 'Confirmed'), -- Reservation for Charlie in Lotus, Single Room
('G4', 23, NULL, '2024-05-15', '12:00:00', '2024-05-25', '12:00:00', 'Confirmed'), -- Reservation for David in Banyan, Double Room
('G5', 43, NULL, '2024-05-20', '12:00:00', '2024-05-30', '12:00:00', 'Confirmed'), -- Reservation for Eve in Ashwatha, VIP Room
('G6', 53, NULL, '2024-05-25', '12:00:00', '2024-06-04', '12:00:00', 'Confirmed'), -- Reservation for Frank in Ashwatha, Non-AC Room
('G7', 21, NULL, '2024-06-01', '12:00:00', '2024-06-11', '12:00:00', 'Confirmed'), -- Reservation for Grace in Lotus, Common Room
('G8', 42, NULL, '2024-06-05', '12:00:00', '2024-06-15', '12:00:00', 'Confirmed'), -- Reservation for Harry in Banyan, Common Room
('G9', 62, NULL, '2024-06-10', '12:00:00', '2024-06-20', '12:00:00', 'Confirmed'), -- Reservation for Ivy in Ashwatha, AC Room
('G10', 63, NULL, '2024-06-15', '12:00:00', '2024-06-25', '12:00:00', 'Confirmed'); -- Reservation for Jack in Ashwatha, AC Room

-- Billing table
INSERT INTO Billing (BillingID, TotalAmount, PaymentStatus, GuestID)
VALUES 
('B1', 1800.00, 'Unpaid', 'G1'), -- Billing for Alice
('B2', 1000.00, 'Unpaid', 'G2'), -- Billing for Bob
('B3', 1000.00, 'Unpaid', 'G3'), -- Billing for Charlie
('B4', 1800.00, 'Unpaid', 'G4'), -- Billing for David
('B5', 11000.00, 'Unpaid', 'G5'), -- Billing for Eve
('B6', 4050.00, 'Unpaid', 'G6'), -- Billing for Frank
('B7', 2000.00, 'Unpaid', 'G7'), -- Billing for Grace
('B8', 1000.00, 'Unpaid', 'G8'), -- Billing for Harry
('B9', 15000.00, 'Unpaid', 'G9'), -- Billing for Ivy
('B10', 15000.00, 'Unpaid', 'G10'); -- Billing for Jack

-- Payment table
INSERT INTO Payment (PaymentID, PaymentDate, PaymentMethod, BillingID)
VALUES 
('P1', '2024-05-10', 'Cash', 'B1'), -- Payment for Alice
('P2', '2024-05-15', 'Credit Card', 'B2'), -- Payment for Bob
('P3', '2024-05-20', 'Cash', 'B3'), -- Payment for Charlie
('P4', '2024-05-25', 'Credit Card', 'B4'), -- Payment for David
('P5', '2024-05-30', 'Cash', 'B5'), -- Payment for Eve
('P6', '2024-06-04', 'Credit Card', 'B6'), -- Payment for Frank
('P7', '2024-06-11', 'Cash', 'B7'), -- Payment for Grace
('P8', '2024-06-15', 'Credit Card', 'B8'), -- Payment for Harry
('P9', '2024-06-20', 'Cash', 'B9'), -- Payment for Ivy
('P10', '2024-06-25', 'Credit Card', 'B10'); -- Payment for Jack

-- RoomBookingLog table
INSERT INTO RoomBookingLog (BookingLogID, BookingDate, NumberOfRooms, PaymentID)
VALUES 
('BL1', '2024-05-01', 1, 'P1'), -- Room booking log for Alice
('BL2', '2024-05-05', 1, 'P2'), -- Room booking log for Bob
('BL3', '2024-05-10', 1, 'P3'), -- Room booking log for Charlie
('BL4', '2024-05-15', 1, 'P4'), -- Room booking log for David
('BL5', '2024-05-20', 1, 'P5'), -- Room booking log for Eve
('BL6', '2024-05-25', 1, 'P6'), -- Room booking log for Frank
('BL7', '2024-06-01', 1, 'P7'), -- Room booking log for Grace
('BL8', '2024-06-05', 1, 'P8'), -- Room booking log for Harry
('BL9', '2024-06-10', 1, 'P9'), -- Room booking log for Ivy
('BL10', '2024-06-15', 1, 'P10'); -- Room booking log for Jack

-- Cancellation table
INSERT INTO Cancellation (CancellationID, PaymentID, CancellationStatus, RefundStatus)
VALUES 
('C1', NULL, 'Pending', 'Not Refunded'), -- Cancellation for Alice
('C2', NULL, 'Pending', 'Not Refunded'), -- Cancellation for Bob
('C3', NULL, 'Pending', 'Not Refunded'), -- Cancellation for Charlie
('C4', NULL, 'Pending', 'Not Refunded'), -- Cancellation for David
('C5', NULL, 'Pending', 'Not Refunded'), -- Cancellation for Eve
('C6', NULL, 'Pending', 'Not Refunded'), -- Cancellation for Frank
('C7', NULL, 'Pending', 'Not Refunded'), -- Cancellation for Grace
('C8', NULL, 'Pending', 'Not Refunded'), -- Cancellation for Harry
('C9', NULL, 'Pending', 'Not Refunded'), -- Cancellation for Ivy
('C10', NULL, 'Pending', 'Not Refunded'); -- Cancellation for Jack

-- Feedback table
INSERT INTO Feedback (FeedbackID, FeedbackType, Rating, Description, CancellationID, PaymentID)
VALUES 
('F1', 'Room Service', 5, 'Excellent service!', NULL, NULL), -- Feedback for Alice
('F2', 'Room Cleanliness', 4, 'Room was clean but could be better.', NULL, NULL), -- Feedback for Bob
('F3', 'Staff Behavior', 5, 'Staff was very polite and helpful.', NULL, NULL), -- Feedback for Charlie
('F4', 'Facilities', 4, 'Good facilities provided.', NULL, NULL), -- Feedback for David
('F5', 'Room Comfort', 5, 'Very comfortable room.', NULL, NULL), -- Feedback for Eve
('F6', 'Room Service', 3, 'Service was slow.', NULL, NULL), -- Feedback for Frank
('F7', 'Room Cleanliness', 5, 'Room was very clean.', NULL, NULL), -- Feedback for Grace
('F8', 'Staff Behavior', 4, 'Staff was friendly.', NULL, NULL), -- Feedback for Harry
('F9', 'Facilities', 5, 'Excellent facilities.', NULL, NULL), -- Feedback for Ivy
('F10', 'Room Comfort', 4, 'Comfortable stay.', NULL, NULL); -- Feedback for Jack

-- Adding foreign key constraints to the Reservation table
ALTER TABLE Reservation
ADD FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
ADD FOREIGN KEY (RoomID) REFERENCES Room(RoomNo),
ADD FOREIGN KEY (BillingID) REFERENCES Billing(BillingID);

-- Adding foreign key constraints to the Billing table
ALTER TABLE Billing
ADD FOREIGN KEY (GuestID) REFERENCES Guest(GuestID);

-- Adding foreign key constraints to the Payment table
ALTER TABLE Payment
ADD FOREIGN KEY (BillingID) REFERENCES Billing(BillingID);

-- Adding foreign key constraints to the RoomBookingLog table
ALTER TABLE RoomBookingLog
ADD FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID);

-- Adding foreign key constraints to the Cancellation table
ALTER TABLE Cancellation
ADD FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID);

-- Adding foreign key constraints to the Feedback table
ALTER TABLE Feedback
ADD FOREIGN KEY (CancellationID) REFERENCES Cancellation(CancellationID),
ADD FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID);

