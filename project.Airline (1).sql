CREATE DATABASE AirlineDB;
USE AirlineDB;
CREATE TABLE Airline(
Airline_ID INT PRIMARY KEY AUTO_INCREMENT,
Airline_Name varchar(100),
Country VARCHAR(50)
);
CREATE TABLE Airport(
Airport_ID INT PRIMARY KEY AUTO_INCREMENT,
Airport_Name VARCHAR(100),
city VARCHAR(50),
Country VARCHAR(50)
);
CREATE TABLE Aircraft(
Aircraft_ID INT PRIMARY KEY AUTO_INCREMENT,
Model VARCHAR(100),
Capacity INT NOT NULL,
Airline_ID INT,
FOREIGN KEY (Airline_ID) REFERENCES Airline(Airline_ID)
);
CREATE TABLE Flight(
Flight_ID INT PRIMARY KEY AUTO_INCREMENT,
Flight_No VARCHAR(15),
Departure_Time DATETIME,
Arrival_Time DATETIME ,
Duration VARCHAR(50),
Airline_ID INT,
Aircraft_ID INT,
Departure_Airport_ID INT,
Arrival_Airport_ID INT,
FOREIGN KEY (Airline_ID) REFERENCES Airline(Airline_ID),
FOREIGN KEY (Aircraft_ID) REFERENCES Aircraft(Aircraft_ID),
FOREIGN KEY (Departure_Airport_ID) REFERENCES Airport(Airport_ID),
FOREIGN KEY (Arrival_Airport_ID) REFERENCES Airport(Airport_ID)
);
CREATE TABLE Passenger(
passenger_ID INT PRIMARY KEY AUTO_INCREMENT,
Full_Name VARCHAR(100),
Gender VARCHAR(50),
Email VARCHAR(100),
Birthday_Date DATE
);
CREATE TABLE Passport(
Passport_ID INT PRIMARY KEY AUTO_INCREMENT,
Nationality VARCHAR(100),
Expiry_Date DATE,
Issue_Date DATE,
Passenger_ID INT UNIQUE,
FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID)
);
CREATE TABLE Booking(
Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
Booking_Date DATETIME,
Status VARCHAR(20),
Passenger_ID INT,
Flight_ID INT,
FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);
CREATE TABLE Payment(
Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
Payment_Date DATE,
Method VARCHAR(50),
Transaction_No VARCHAR(50),
Booking_ID INT,
FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);
CREATE TABLE Flight_class(
Class_ID INT PRIMARY KEY AUTO_INCREMENT,
Seat_Type VARCHAR(50)
);
CREATE TABLE Seat(
Seats_ID INT PRIMARY KEY AUTO_INCREMENT,
Seat_Type VARCHAR (50),
Aircraft_ID INT,
Class_ID INT,
FOREIGN KEY (Aircraft_ID) REFERENCES Aircraft(Aircraft_ID),
FOREIGN KEY (Class_ID) REFERENCES Flight_Class(Class_ID)
);
CREATE TABLE Ticket(
Ticket_ID INT PRIMARY KEY AUTO_INCREMENT,
Ticket_No VARCHAR(50),
Price DECIMAL(10,2),
Issue_Date Date,
Booking_ID INT,
Seat_ID INT,
FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID),
FOREIGN KEY (Seat_ID) REFERENCES Seat(Seat_ID)
);
CREATE TABLE Boarding_Pass(
BP_ID INT PRIMARY KEY AUTO_INCREMENT,
BP_Time TIME,
BP_No VARCHAR(50),
Ticket_ID INT,
FOREIGN KEY (Ticket_ID) REFERENCES Ticket(Ticket_ID)
);
CREATE TABLE Check_In(
CheckIn_ID INT PRIMARY KEY AUTO_INCREMENT,
CheckIn_Time TIME,
CheckIn_Country VARCHAR(100),
Passenger_ID INT,
Flight_ID INT,
FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);
CREATE TABLE Baggage(
Baggage_ID INT PRIMARY KEY AUTO_INCREMENT,
Weight DECIMAL(5,2),
Tag_No VARCHAR(50),
Baggage_Type VARCHAR(50),
Passenger_ID INT,
FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID)
);
CREATE TABLE Employee(
Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR (100),
Position VARCHAR(50),
Salary INT,
Phone VARCHAR(20),
Airline_ID INT,
FOREIGN KEY (Airline_ID) REFERENCES Airline(Airline_ID)
);
INSERT INTO Airline (Airline_Name, Country)
VALUES
('EgyptAir', 'Egypt'),
('Qatar Airways', 'Qatar'),
('Turkish Airlines', 'Turkey'),
('Lufthansa', 'Germany'),
('Emirates', 'UAE');
INSERT INTO Airport (Airport_Name, City, Country)
VALUES
('Cairo International Airport', 'Cairo', 'Egypt'),
('Hamad International Airport', 'Doha', 'Qatar'),
('Istanbul Airport', 'Istanbul', 'Turkey'),
('Frankfurt Airport', 'Frankfurt', 'Germany'),
('Dubai International Airport', 'Dubai', 'UAE');
INSERT INTO Aircraft (Model, Capacity, Airline_ID)
VALUES
('Boeing 737', 180, 1),
('Airbus A320', 170, 2),
('Airbus A350', 320, 4),
('Boeing 787 Dreamliner', 290, 5),
('Boeing 777', 350, 3);
INSERT INTO Flight
(Flight_No, Departure_Time, Arrival_Time, Duration,
Airline_ID, Aircraft_ID, Departure_Airport_ID, Arrival_Airport_ID)
VALUES
('MS101','2026-08-01 08:00:00','2026-08-01 10:30:00','2h 30m',1,1,1,2),
('TK404','2026-08-05 09:00:00','2026-08-05 12:30:00','3h 30m',4,4,4,1),
('LH505','2026-08-06 14:00:00','2026-08-06 18:00:00','4h',5,5,5,3),
('QR202','2026-08-02 09:00:00','2026-08-02 11:00:00','2h',2,2,2,3),
('EK303','2026-08-03 07:00:00','2026-08-03 10:30:00','3h 30m',3,3,3,1);
INSERT INTO Passenger
(Full_Name, Gender, Email, Birthday_Date)
VALUES
('Ahmed Ali','Male','ahmed@gmail.com','2000-05-12'),
('Sara Mohamed','Female','sara@gmail.com','1999-09-21'),
('Omar Hassan','Male','omar@gmail.com','2001-01-10'),
('Mona Ibrahim','Female','mona@gmail.com','1998-07-15'),
('Youssef Samy','Male','youssef@gmail.com','1997-11-20');
INSERT INTO Passport
(Nationality, Expiry_Date, Issue_Date, Passenger_ID)
VALUES
('Egyptian','2032-01-01','2022-01-01',1),
('Egyptian','2031-06-15','2021-06-15',2),
('Egyptian','2033-03-20','2023-03-20',3),
('Egyptian','2034-05-01','2024-05-01',4),
('Egyptian','2035-08-15','2025-08-15',5);
INSERT INTO Booking
(Booking_Date, Status, Passenger_ID, Flight_ID)
VALUES
('2026-07-20 12:00:00','Confirmed',1,1),
('2026-07-21 15:30:00','Confirmed',2,2),
('2026-07-22 10:45:00','Pending',3,3),
('2026-07-24 13:00:00','Confirmed',4,4),
('2026-07-25 16:45:00','Cancelled',5,5);
INSERT INTO Payment
(Payment_Date, Method, Transaction_No, Booking_ID)
VALUES
('2026-07-20','Credit Card','TRX1001',1),
('2026-07-21','Cash','TRX1002',2),
('2026-07-22','Visa','TRX1003',3),
('2026-07-24','Master Card','TRX1004',4),
('2026-07-25','Cash','TRX1005',5);
INSERT INTO Flight_Class (Seat_Type)
VALUES
('Economy'),
('Business'),
('First Class'),
('Premium Economy'),
('VIP');
INSERT INTO Seat
(Seat_Type, Aircraft_ID, Class_ID)
VALUES
('12A',1,1),
('2B',2,2),
('1A',3,3),
('15C',4,4),
('3A',5,5);
INSERT INTO Ticket
(Ticket_No, Price, Issue_Date, Booking_ID, Seat_ID)
VALUES
('T1001',2500.00,'2026-07-20',1,1),
('T1002',4500.00,'2026-07-21',2,2),
('T1003',7000.00,'2026-07-22',3,3),
('T1004',3200.00,'2026-07-24',4,4),
('T1005',5800.00,'2026-07-25',5,5);
INSERT INTO Boarding_Pass
(BP_Time, BP_No, Ticket_ID)
VALUES
('07:15:00','BP001',1),
('08:15:00','BP002',2),
('06:15:00','BP003',3),
('08:15:00','BP004',4),
('13:15:00','BP005',5);
INSERT INTO Check_In
(CheckIn_Time, CheckIn_Country, Passenger_ID, Flight_ID)
VALUES
('06:30:00','Egypt',1,1),
('07:30:00','Qatar',2,2),
('05:45:00','UAE',3,3),
('07:30:00','Turkey',4,4),
('12:30:00','Germany',5,5);
INSERT INTO Baggage
(Weight, Tag_No, Baggage_Type, Passenger_ID)
VALUES
(20.50,'BG1001','Checked',1),
(15.00,'BG1002','Cabin',2),
(25.75,'BG1003','Checked',3),
(18.25,'BG1004','Checked',4),
(10.50,'BG1005','Cabin',5);
INSERT INTO Employee
(Name, Position, Salary, Phone, Airline_ID)
VALUES
('Mohamed Adel','Pilot',30000,'01012345678',1),
('Nour Ahmed','Cabin Crew',15000,'01123456789',2),
('Ali Mahmoud','Engineer',20000,'01234567890',3),
('Fatma Hassan','Ground Staff',12000,'01098765432',4),
('Khaled Amin','Pilot',35000,'01187654321',5);
SELECT *
FROM Ticket
WHERE Price > 4500
ORDER BY Price DESC;
SELECT
Position,
AVG(Salary) AS Average_Salary
FROM Employee
WHERE Salary >= 15000
GROUP BY Position
HAVING AVG(Salary) > 20000;
SELECT
Airline_ID,
AVG(Capacity) AS Avg_Capacity
FROM Aircraft
WHERE Capacity > 150
GROUP BY Airline_ID
HAVING AVG(Capacity) > 250;
SELECT
Method,
COUNT(Payment_ID) AS Total_Payments
FROM Payment
GROUP BY Method;
SELECT
Passenger.Full_Name,
Booking.Booking_ID
FROM Passenger 
INNER JOIN Booking 
ON Passenger.Passenger_ID = Booking.Passenger_ID;
SELECT
Airline.Airline_name,
Aircraft.Model
FROM Airline 
RIGHT JOIN Aircraft 
ON Airline.Airline_ID = Aircarft.Airline_ID;
SELECT
Flight_Class.Class_ID,
Seat.Seat_type
FROM Flight_Class 
RIGHT JOIN Seat 
ON Flight_Class.Class_ID = Seat.Class_ID;
ALTER TABLE Passenger
ADD Phone VARCHAR(20);
ALTER TABLE Ticket
MODIFY Price INT;
ALTER TABLE Employee
RENAME to Employees;
ALTER TABLE Airport
DROP COLUMN City;
DELETE FROM Check_In;


























