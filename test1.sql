-- Create the database
CREATE DATABASE IF NOT EXISTS HotelManagementDB;
USE HotelManagementDB;

-- Create Rooms table
CREATE TABLE Rooms (
    Room_No INT PRIMARY KEY,
    Hostel_Name VARCHAR(255),
    Availability_status VARCHAR(50),
    Type_ID INT,
    User_ID INT,
    FOREIGN KEY (Type_ID) REFERENCES Room_Type(Type_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- Create Users table
CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    User_Name VARCHAR(255),
    Email VARCHAR(255),
    Password_Hash VARCHAR(255),
    Role VARCHAR(50)
);

-- Create Guests table
CREATE TABLE Guests (
    Guest_ID INT PRIMARY KEY,
    Guest_Name VARCHAR(255),
    Guest_SSN VARCHAR(50),
    Phone_No VARCHAR(50),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- Create Reservations table
CREATE TABLE Reservations (
    Check_IN_Date DATE,
    Check_IN_Time TIME,
    Check_OUT_Date DATE,
    Check_OUT_Time TIME,
    Reservation_status VARCHAR(50),
    Guest_ID INT,
    Room_ID INT,
    Billing_ID INT,
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID),
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_No),
    FOREIGN KEY (Billing_ID) REFERENCES Billing(Billing_ID)
);

-- Create Billing table
CREATE TABLE Billing (
    Billing_ID INT PRIMARY KEY,
    Total_Amount DECIMAL(10, 2),
    Payment_Status VARCHAR(50),
    Guest_ID INT,
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID)
);

-- Create Payments table
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Payment_Date DATE,
    Payment_method VARCHAR(50),
    Billing_ID INT,
    FOREIGN KEY (Billing_ID) REFERENCES Billing(Billing_ID)
);

-- Create Cancellations table
CREATE TABLE Cancellations (
    Cancellation_ID INT PRIMARY KEY,
    Payment_ID INT,
    Cancellation_Status VARCHAR(50),
    Refund_Status VARCHAR(50),
    FOREIGN KEY (Payment_ID) REFERENCES Payments(Payment_ID)
);

-- Create Booking_Log table
CREATE TABLE Booking_Log (
    Booking_Log_ID INT PRIMARY KEY,
    Booking_Date DATE,
    Payment_ID INT,
    FOREIGN KEY (Payment_ID) REFERENCES Payments(Payment_ID)
);

-- Create Feedback table
CREATE TABLE Feedback (
    Feedback_ID INT PRIMARY KEY,
    Feedback_Type VARCHAR(50),
    Rating INT,
    Description TEXT,
    Cancellation_ID INT,
    Payment_ID INT,
    FOREIGN KEY (Cancellation_ID) REFERENCES Cancellations(Cancellation_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payments(Payment_ID)
);

-- Insert data into Rooms table
INSERT INTO Rooms (Room_No, Hostel_Name, Availability_status, Type_ID, User_ID) VALUES
(101, 'Hostel A', 'Available', 1, 1),
(102, 'Hostel B', 'Available', 2, 2),
(103, 'Hostel C', 'Occupied', 1, 3),
(104, 'Hostel D', 'Available', 2, 4),
(105, 'Hostel E', 'Available', 1, 5),
(106, 'Hostel F', 'Occupied', 2, 6),
(107, 'Hostel G', 'Available', 1, 7),
(108, 'Hostel H', 'Available', 2, 8),
(109, 'Hostel I', 'Occupied', 1, 9),
(110, 'Hostel J', 'Available', 2, 10);

-- Insert data into Users table
INSERT INTO Users (User_ID, User_Name, Email, Password_Hash, Role) VALUES
(1, 'John', 'john@example.com', 'password_hash_1', 'Admin'),
(2, 'Jane', 'jane@example.com', 'password_hash_2', 'User'),
(3, 'Alex', 'alex@example.com', 'password_hash_3', 'User'),
(4, 'Emily', 'emily@example.com', 'password_hash_4', 'User'),
(5, 'Michael', 'michael@example.com', 'password_hash_5', 'User'),
(6, 'Sarah', 'sarah@example.com', 'password_hash_6', 'User'),
(7, 'David', 'david@example.com', 'password_hash_7', 'User'),
(8, 'Olivia', 'olivia@example.com', 'password_hash_8', 'User'),
(9, 'James', 'james@example.com', 'password_hash_9', 'User'),
(10, 'Emma', 'emma@example.com', 'password_hash_10', 'User');

-- Insert data into Guests table
INSERT INTO Guests (Guest_ID, Guest_Name, Guest_SSN, Phone_No, User_ID) VALUES
(1, 'Mark', '123-45-6789', '1234567890', 2),
(2, 'Lisa', '987-65-4321', '9876543210', 3),
(3, 'Sophia', '456-78-9012', '4567890123', 4),
(4, 'Ethan', '654-32-1098', '6543210987', 5),
(5, 'Mia', '789-01-2345', '7890123456', 6),
(6, 'William', '321-09-8765', '3210987654', 7),
(7, 'Ava', '567-89-0123', '5678901234', 8),
(8, 'Alexander', '890-12-3456', '8901234567', 9),
(9, 'Isabella', '098-76-5432', '0987654321', 10),
(10, 'Benjamin', '210-98-7654', '2109876543', 2);

-- Insert data into Billing table
INSERT INTO Billing (Billing_ID, Total_Amount, Payment_Status, Guest_ID) VALUES
(1, 500, 'Paid', 1),
(2, 600, 'Paid', 2),
(3, 700, 'Unpaid', 3),
(4, 800, 'Paid', 4),
(5, 900, 'Unpaid', 5),
(6, 1000, 'Paid', 6),
(7, 1100, 'Paid', 7),
(8, 1200, 'Unpaid', 8),
(9, 1300, 'Paid', 9),
(10, 1400, 'Unpaid', 10);

-- Insert data into Payments table
INSERT INTO Payments (Payment_ID, Payment_Date, Payment_method, Billing_ID) VALUES
(1, '2024-03-20', 'Credit Card', 1),
(2, '2024-03-21', 'PayPal', 2),
(3, '2024-03-22', 'Cash', 3),
(4, '2024-03-23', 'Credit Card', 4),
-- Insert data into Payments table (continued)
(5, '2024-03-24', 'PayPal', 5),
(6, '2024-03-25', 'Cash', 6),
(7, '2024-03-26', 'Credit Card', 7),
(8, '2024-03-27', 'PayPal', 8),
(9, '2024-03-28', 'Cash', 9),
(10, '2024-03-29', 'Credit Card', 10);

-- Insert data into Cancellations table
INSERT INTO Cancellations (Cancellation_ID, Payment_ID, Cancellation_Status, Refund_Status) VALUES
(1, 1, 'Cancelled', 'Refunded'),
(2, 2, 'Cancelled', 'Not Refunded'),
(3, 3, 'Cancelled', 'Not Refunded'),
(4, 4, 'Cancelled', 'Refunded'),
(5, 5, 'Cancelled', 'Not Refunded'),
(6, 6, 'Cancelled', 'Refunded'),
(7, 7, 'Cancelled', 'Refunded'),
(8, 8, 'Cancelled', 'Not Refunded'),
(9, 9, 'Cancelled', 'Refunded'),
(10, 10, 'Cancelled', 'Not Refunded');

-- Insert data into Booking_Log table
INSERT INTO Booking_Log (Booking_Log_ID, Booking_Date, Payment_ID) VALUES
(1, '2024-03-20', 1),
(2, '2024-03-21', 2),
(3, '2024-03-22', 3),
(4, '2024-03-23', 4),
(5, '2024-03-24', 5),
(6, '2024-03-25', 6),
(7, '2024-03-26', 7),
(8, '2024-03-27', 8),
(9, '2024-03-28', 9),
(10, '2024-03-29', 10);

-- Insert data into Feedback table
INSERT INTO Feedback (Feedback_ID, Feedback_Type, Rating, Description, Cancellation_ID, Payment_ID) VALUES
(1, 'Service', 4, 'Good service overall.', 1, 1),
(2, 'Service', 3, 'Average service.', 2, 2),
(3, 'Service', 5, 'Excellent service!', 3, 3),
(4, 'Service', 2, 'Poor service experience.', 4, 4),
(5, 'Service', 4, 'Satisfactory service.', 5, 5),
(6, 'Service', 5, 'Great service, highly recommended.', 6, 6),
(7, 'Service', 4, 'Good service overall.', 7, 7),
(8, 'Service', 3, 'Average service.', 8, 8),
(9, 'Service', 5, 'Excellent service!', 9, 9),
(10, 'Service', 2, 'Poor service experience.', 10, 10);
