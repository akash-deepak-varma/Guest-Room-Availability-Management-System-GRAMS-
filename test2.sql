-- Create User table
CREATE TABLE User (
    UserID VARCHAR PRIMARY KEY,
    UserName VARCHAR,
    Email VARCHAR,
    PasswordHash VARCHAR,
    Role VARCHAR
);

-- Create Room table
CREATE TABLE Room (
    RoomNo INT PRIMARY KEY,
    HostelName VARCHAR,
    AvailabilityStatus VARCHAR,
    TypeID VARCHAR,
    UserID VARCHAR
);

-- Create RoomType table
CREATE TABLE RoomType (
    TypeID VARCHAR PRIMARY KEY,
    TypeName VARCHAR,
    Capacity INT,
    Price DECIMAL,
    Image BLOB,
    Description TEXT
);

-- Create Guest table
CREATE TABLE Guest (
    GuestID VARCHAR PRIMARY KEY,
    GuestName VARCHAR,
    GuestSSN VARCHAR,
    PhoneNo VARCHAR,
    UserID VARCHAR
);

-- Create Reservation table
CREATE TABLE Reservation (
    GuestID VARCHAR,
    RoomID INT,
    BillingID VARCHAR,
    CheckInDate DATE,
    CheckInTime TIME,
    CheckOutDate DATE,
    CheckOutTime TIME,
    ReservationStatus VARCHAR
);

-- Create Billing table
CREATE TABLE Billing (
    BillingID VARCHAR PRIMARY KEY,
    TotalAmount DECIMAL,
    PaymentStatus VARCHAR,
    GuestID VARCHAR
);

-- Create Payment table
CREATE TABLE Payment (
    PaymentID VARCHAR PRIMARY KEY,
    PaymentDate DATE,
    PaymentMethod VARCHAR,
    BillingID VARCHAR
);

-- Create RoomBookingLog table
CREATE TABLE RoomBookingLog (
    BookingLogID VARCHAR PRIMARY KEY,
    BookingDate DATE,
    NumberOfRooms INT,
    PaymentID VARCHAR
);

-- Create Cancellation table
CREATE TABLE Cancellation (
    CancellationID VARCHAR PRIMARY KEY,
    PaymentID VARCHAR,
    CancellationStatus VARCHAR,
    RefundStatus VARCHAR
);

-- Create Feedback table
CREATE TABLE Feedback (
    FeedbackID VARCHAR PRIMARY KEY,
    FeedbackType VARCHAR,
    Rating INT,
    Description TEXT,
    CancellationID VARCHAR,
    PaymentID VARCHAR
);


-- Alter User table to add foreign key constraint
ALTER TABLE Room ADD CONSTRAINT FK_User_Room FOREIGN KEY (UserID) REFERENCES User(UserID);

-- Alter Room table to add foreign key constraints
ALTER TABLE Room ADD CONSTRAINT FK_Room_RoomType FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID);
ALTER TABLE Room ADD CONSTRAINT FK_Room_User FOREIGN KEY (UserID) REFERENCES User(UserID);

-- Alter Guest table to add foreign key constraint
ALTER TABLE Guest ADD CONSTRAINT FK_Guest_User FOREIGN KEY (UserID) REFERENCES User(UserID);

-- Alter Reservation table to add foreign key constraints
ALTER TABLE Reservation ADD CONSTRAINT FK_Reservation_Guest FOREIGN KEY (GuestID) REFERENCES Guest(GuestID);
ALTER TABLE Reservation ADD CONSTRAINT FK_Reservation_Room FOREIGN KEY (RoomID) REFERENCES Room(RoomNo);
ALTER TABLE Reservation ADD CONSTRAINT FK_Reservation_Billing FOREIGN KEY (BillingID) REFERENCES Billing(BillingID);

-- Alter Billing table to add foreign key constraint
ALTER TABLE Billing ADD CONSTRAINT FK_Billing_Guest FOREIGN KEY (GuestID) REFERENCES Guest(GuestID);

-- Alter Payment table to add foreign key constraint
ALTER TABLE Payment ADD CONSTRAINT FK_Payment_Billing FOREIGN KEY (BillingID) REFERENCES Billing(BillingID);

-- Alter RoomBookingLog table to add foreign key constraint
ALTER TABLE RoomBookingLog ADD CONSTRAINT FK_RoomBookingLog_Payment FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID);

-- Alter Cancellation table to add foreign key constraint
ALTER TABLE Cancellation ADD CONSTRAINT FK_Cancellation_Payment FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID);

-- Alter Feedback table to add foreign key constraints
ALTER TABLE Feedback ADD CONSTRAINT FK_Feedback_Cancellation FOREIGN KEY (CancellationID) REFERENCES Cancellation(CancellationID);
ALTER TABLE Feedback ADD CONSTRAINT FK_Feedback_Payment FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID);


-- Inserting records into User table
INSERT INTO User (UserID, UserName, Email, PasswordHash, Role) VALUES
('1', 'John Doe', 'john@example.com', 'password123', 'Admin'),
('2', 'Jane Smith', 'jane@example.com', 'password456', 'User'),
('3', 'Michael Johnson', 'michael@example.com', 'password789', 'User'),
('4', 'Emily Davis', 'emily@example.com', 'passwordabc', 'User'),
('5', 'Christopher Brown', 'chris@example.com', 'passworddef', 'User'),
('6', 'Jessica Wilson', 'jessica@example.com', 'passwordghi', 'User'),
('7', 'David Martinez', 'david@example.com', 'passwordjkl', 'User'),
('8', 'Ashley Anderson', 'ashley@example.com', 'passwordmno', 'User'),
('9', 'Daniel Taylor', 'daniel@example.com', 'passwordpqr', 'User'),
('10', 'Sarah Thomas', 'sarah@example.com', 'passwordstu', 'User'),
('11', 'Matthew Jackson', 'matthew@example.com', 'passwordvwx', 'User'),
('12', 'Olivia White', 'olivia@example.com', 'passwordyz1', 'User'),
('13', 'Andrew Harris', 'andrew@example.com', 'password234', 'User'),
('14', 'Emma Martin', 'emma@example.com', 'password567', 'User'),
('15', 'James Garcia', 'james@example.com', 'password890', 'User'),
('16', 'Madison Lopez', 'madison@example.com', 'passwordabc2', 'User'),
('17', 'Joshua Young', 'joshua@example.com', 'passworddef3', 'User'),
('18', 'Ava Lee', 'ava@example.com', 'passwordghi4', 'User'),
('19', 'Logan Perez', 'logan@example.com', 'passwordjkl5', 'User'),
('20', 'Sophia King', 'sophia@example.com', 'passwordmno6', 'User');

-- Inserting records into RoomType table
INSERT INTO RoomType (TypeID, TypeName, Capacity, Price, Image, Description) VALUES
('101', 'Single', 1, 50.00, NULL, 'Single occupancy room'),
('102', 'Double', 2, 80.00, NULL, 'Double occupancy room'),
('103', 'Suite', 4, 150.00, NULL, 'Luxurious suite with multiple rooms'),
('104', 'Dormitory', 6, 20.00, NULL, 'Shared room with multiple beds');

-- Inserting records into Room table
INSERT INTO Room (RoomNo, HostelName, AvailabilityStatus, TypeID, UserID) VALUES
(101, 'Hostel A', 'Available', '101', '1'),
(102, 'Hostel A', 'Available', '102', '1'),
(103, 'Hostel B', 'Available', '101', '2'),
(104, 'Hostel B', 'Available', '102', '2'),
(105, 'Hostel C', 'Available', '103', '3'),
(106, 'Hostel C', 'Available', '103', '3'),
(107, 'Hostel D', 'Available', '104', '4'),
(108, 'Hostel D', 'Available', '104', '4'),
(109, 'Hostel E', 'Available', '101', '5'),
(110, 'Hostel E', 'Available', '102', '5'),
(111, 'Hostel F', 'Available', '103', '6'),
(112, 'Hostel F', 'Available', '103', '6'),
(113, 'Hostel G', 'Available', '104', '7'),
(114, 'Hostel G', 'Available', '104', '7'),
(115, 'Hostel H', 'Available', '101', '8'),
(116, 'Hostel H', 'Available', '102', '8'),
(117, 'Hostel I', 'Available', '103', '9'),
(118, 'Hostel I', 'Available', '103', '9'),
(119, 'Hostel J', 'Available', '104', '10'),
(120, 'Hostel J', 'Available', '104', '10');

-- Inserting records into Guest table
INSERT INTO Guest (GuestID, GuestName, GuestSSN, PhoneNo, UserID) VALUES
('1001', 'Alice Johnson', '123456789', '123-456-7890', '11'),
('1002', 'Bob Smith', '987654321', '987-654-3210', '12'),
('1003', 'Carol Williams', '456789123', '456-789-1230', '13'),
('1004', 'David Brown', '321654987', '321-654-9870', '14'),
('1005', 'Emma Jones', '789123456', '789-123-4560', '15'),
('1006', 'Frank Miller', '654987321', '654-987-3210', '16'),
('1007', 'Grace Davis', '987123456', '987-123-4560', '17'),
('1008', 'Henry Wilson', '321789456', '321-789-4560', '18'),
('1009', 'Ivy Taylor', '456321789', '456-321-7890', '19'),
('1010', 'Jack Anderson', '789456321', '789-456-3210', '20'),
('1011', 'Kelly Thomas', '654123789', '654-123-7890', '1'),
('1012', 'Liam Martin', '987456123', '987-456-1230', '2'),
('1013', 'Mia White', '123789654', '123-789-6540', '3'),
('1014', 'Nathan Lee', '456987123', '456-987-1230', '4'),
('1015', 'Olivia Perez', '789654123', '789-654-1230', '5'),
('1016', 'Patrick Garcia', '123987456', '123-987-4560', '6'),
('1017', 'Quinn King', '456321789', '456-321-7890', '7'),
('1018', 'Rachel Hernandez', '987654321', '987-654-3210', '8'),
('1019', 'Samuel Scott', '321456987', '321-456-9870', '9'),
('1020', 'Taylor Phillips', '654123987', '654-123-9870', '10');

-- Inserting records into Reservation table
INSERT INTO Reservation (GuestID, RoomID, BillingID, CheckInDate, CheckInTime, CheckOutDate, CheckOutTime, ReservationStatus) VALUES
('1001', 101, '10101', '2024-05-01', '12:00:00', '2024-05-05', '10:00:00', 'Confirmed'),
('1002', 102, '10102', '2024-05-02', '12:00:00', '2024-05-04', '10:00:00', 'Confirmed'),
('1003', 103, '10103', '2024-05-03', '12:00:00', '2024-05-06', '10:00:00', 'Confirmed'),
('1004', 104, '10104', '2024-05-04', '12:00:00', '2024-05-07', '10:00:00', 'Confirmed'),
('1005', 105, '10105', '2024-05-05', '12:00:00', '2024-05-08', '10:00:00', 'Confirmed'),
('1006', 106, '10106', '2024-05-06', '12:00:00', '2024-05-09', '10:00:00', 'Confirmed'),
('1007', 107, '10107', '2024-05-07', '12:00:00', '2024-05-10', '10:00:00', 'Confirmed'),
('1008', 108, '10108', '2024-05-08', '12:00:00', '2024-05-11', '10:00:00', 'Confirmed'),
('1009', 109, '10109', '2024-05-09', '12:00:00', '2024-05-12', '10:00:00', 'Confirmed'),
('1010', 110, '10110', '2024-05-10', '12:00:00', '2024-05-13', '10:00:00', 'Confirmed'),
('1011', 111, '10111', '2024-05-11', '12:00:00', '2024-05-14', '10:00:00', 'Confirmed'),
('1012', 112, '10112', '2024-05-12', '12:00:00', '2024-05-15', '10:00:00', 'Confirmed'),
('1013', 113, '10113', '2024-05-13', '12:00:00', '2024-05-16', '10:00:00', 'Confirmed'),
('1014', 114, '10114', '2024-05-14', '12:00:00', '2024-05-17', '10:00:00', 'Confirmed'),
('1015', 115, '10115', '2024-05-15', '12:00:00', '2024-05-18', '10:00:00', 'Confirmed'),
('1016', 116, '10116', '2024-05-16', '12:00:00', '2024-05-19', '10:00:00', 'Confirmed'),
('1017', 117, '10117', '2024-05-17', '12:00:00', '2024-05-20', '10:00:00', 'Confirmed'),
('1018', 118, '10118', '2024-05-18', '12:00:00', '2024-05-21', '10:00:00', 'Confirmed'),
('1019', 119, '10119', '2024-05-19', '12:00:00', '2024-05-22', '10:00:00', 'Confirmed'),
('1020', 120, '10120', '2024-05-20', '12:00:00', '2024-05-23', '10:00:00', 'Confirmed');

-- Inserting records into Billing table
INSERT INTO Billing (BillingID, TotalAmount, PaymentStatus, GuestID) VALUES
('10101', 200.00, 'Paid', '1001'),
('10102', 160.00, 'Paid', '1002'),
('10103', 250.00, 'Paid', '1003'),
('10104', 270.00, 'Paid', '1004'),
('10105', 300.00, 'Paid', '1005'),
('10106', 360.00, 'Paid', '1006'),
('10107', 150.00, 'Paid', '1007'),
('10108', 200.00, 'Paid', '1008'),
('10109', 120.00, 'Paid', '1009'),
('10110', 160.00, 'Paid', '1010'),
('10111', 400.00, 'Paid', '1011'),
('10112', 500.00, 'Paid', '1012'),
('10113', 300.00, 'Paid', '1013'),
('10114', 270.00, 'Paid', '1014'),
('10115', 250.00, 'Paid', '1015'),
('10116', 400.00, 'Paid', '1016'),
('10117', 350.00, 'Paid', '1017'),
('10118', 320.00, 'Paid', '1018'),
('10119', 280.00, 'Paid', '1019'),
('10120', 200.00, 'Paid', '1020');

-- Inserting records into Payment table
INSERT INTO Payment (PaymentID, PaymentDate, PaymentMethod, BillingID) VALUES
('10001', '2024-05-05', 'Credit Card', '10101'),
('10002', '2024-05-04', 'Debit Card', '10102'),
('10003', '2024-05-06', 'PayPal', '10103'),
('10004', '2024-05-07', 'Cash', '10104'),
('10005', '2024-05-08', 'Credit Card', '10105'),
('10006', '2024-05-09', 'Debit Card', '10106'),
('10007', '2024-05-10', 'PayPal', '10107'),
('10008', '2024-05-11', 'Cash', '10108'),
('10009', '2024-05-12', 'Credit Card', '10109'),
('10010', '2024-05-13', 'Debit Card', '10110'),
('10011', '2024-05-14', 'PayPal', '10111'),
('10012', '2024-05-15', 'Cash', '10112'),
('10013', '2024-05-16', 'Credit Card', '10113'),
('10014', '2024-05-17', 'Debit Card', '10114'),
('10015', '2024-05-18', 'PayPal', '10115'),
('10016', '2024-05-19', 'Cash', '10116'),
('10017', '2024-05-20', 'Credit Card', '10117'),
('10018', '2024-05-21', 'Debit Card', '10118'),
('10019', '2024-05-22', 'PayPal', '10119'),
('10020', '2024-05-23', 'Cash', '10120');

-- Inserting records into RoomBookingLog table
INSERT INTO RoomBookingLog (BookingLogID, BookingDate, NumberOfRooms, PaymentID) VALUES
('20101', '2024-05-05', 1, '10001'),
('20102', '2024-05-04', 1, '10002'),
('20103', '2024-05-06', 1, '10003'),
('20104', '2024-05-07', 1, '10004'),
('20105', '2024-05-08', 1, '10005'),
('20106', '2024-05-09', 1, '10006'),
('20107', '2024-05-10', 1, '10007'),
('20108', '2024-05-11', 1, '10008'),
('20109', '2024-05-12', 1, '10009'),
('20110', '2024-05-13', 1, '10010'),
('20111', '2024-05-14', 1, '10011'),
('20112', '2024-05-15', 1, '10012'),
('20113', '2024-05-16', 1, '10013'),
('20114', '2024-05-17', 1, '10014'),
('20115', '2024-05-18', 1, '10015'),
('20116', '2024-05-19', 1, '10016'),
('20117', '2024-05-20', 1, '10017'),
('20118', '2024-05-21', 1, '10018'),
('20119', '2024-05-22', 1, '10019'),
('20120', '2024-05-23', 1, '10020');

-- Inserting records into Cancellation table
INSERT INTO Cancellation (CancellationID, PaymentID, CancellationStatus, RefundStatus) VALUES
('30101', '10001', 'Cancelled', 'Refunded'),
('30102', '10002', 'Cancelled', 'Refunded'),
('30103', '10003', 'Cancelled', 'Refunded'),
('30104', '10004', 'Cancelled', 'Refunded'),
('30105', '10005', 'Cancelled', 'Refunded'),
('30106', '10006', 'Cancelled', 'Refunded'),
('30107', '10007', 'Cancelled', 'Refunded'),
('30108', '10008', 'Cancelled', 'Refunded'),
('30109', '10009', 'Cancelled', 'Refunded'),
('30110', '10010', 'Cancelled', 'Refunded'),
('30111', '10011', 'Cancelled', 'Refunded'),
('30112', '10012', 'Cancelled', 'Refunded'),
('30113', '10013', 'Cancelled', 'Refunded'),
('30114', '10014', 'Cancelled', 'Refunded'),
('30115', '10015', 'Cancelled', 'Refunded'),
('30116', '10016', 'Cancelled', 'Refunded'),
('30117', '10017', 'Cancelled', 'Refunded'),
('30118', '10018', 'Cancelled', 'Refunded'),
('30119', '10019', 'Cancelled', 'Refunded'),
('30120', '10020', 'Cancelled', 'Refunded');

-- Inserting records into Feedback table
INSERT INTO Feedback (FeedbackID, FeedbackType, Rating, Description, CancellationID, PaymentID) VALUES
('40101', 'Service', 4, 'Great service!', '30101', NULL),
('40102', 'Room', 5, 'Comfortable room.', '30102', NULL),
('40103', 'Staff', 3, 'Staff could be more friendly.', '30103', NULL),
('40104', 'Facilities', 4, 'Good facilities.', '30104', NULL),
('40105', 'Location', 5, 'Convenient location.', '30105', NULL),
('40106', 'Cleanliness', 4, 'Clean room.', '30106', NULL),
('40107', 'Service', 5, 'Excellent service!', '30107', NULL),
('40108', 'Room', 4, 'Spacious room.', '30108', NULL),
('40109', 'Staff', 3, 'Helpful staff.', '30109', NULL),
('40110', 'Facilities', 4, 'Well-maintained facilities.', '30110', NULL),
('40111', 'Location', 5, 'Perfect location.', '30111', NULL),
('40112', 'Cleanliness', 5, 'Very clean!', '30112', NULL),
('40113', 'Service', 4, 'Polite service.', '30113', NULL),
('40114', 'Room', 4, 'Comfortable bed.', '30114', NULL),
('40115', 'Staff', 3, 'Efficient staff.', '30115', NULL),
('40116', 'Facilities', 4, 'Good amenities.', '30116', NULL),
('40117', 'Location', 5, 'Beautiful location.', '30117', NULL),
('40118', 'Cleanliness', 5, 'Spotless!', '30118', NULL),
('40119', 'Service', 4, 'Prompt service.', '30119', NULL),
('40120', 'Room', 4, 'Nice view from the room.', '30120', NULL);
