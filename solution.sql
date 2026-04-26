DROP DATABASE IF EXISTS BUS385_TGP;

set sql_safe_updates = 0;

CREATE DATABASE IF NOT EXISTS BUS385_TGP;
USE BUS385_TGP;

#### CREATING ALL TABLES NEEDED

CREATE TABLE MembershipPlans (
    MembershipPlanID INT AUTO_INCREMENT PRIMARY KEY,
    PlanName VARCHAR(50),
    MonthlyFee DECIMAL(10,2),
    DurationMonths INT,
    AccessLevel VARCHAR(50)
);

CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    JoinDate DATE,
    MembershipPlanID INT,
    FOREIGN KEY (MembershipPlanID) REFERENCES MembershipPlans(MembershipPlanID)
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Classes (
    ClassID INT AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(50),
    Instructor VARCHAR(100),
    ScheduleDateTime DATETIME,
    Capacity INT
);

CREATE TABLE ClassRegistrations (
    RegistrationID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    ClassID INT,
    RegistrationDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

#### ALTERED ALL TABLES TO REFLECT NOT NULL VALUES

ALTER TABLE MembershipPlans
MODIFY PlanName VARCHAR(50) NOT NULL,
MODIFY MonthlyFee DECIMAL(10,2) NOT NULL,
MODIFY DurationMonths INT NOT NULL,
MODIFY AccessLevel VARCHAR(50) NOT NULL;

ALTER TABLE Members
MODIFY FirstName VARCHAR(50) NOT NULL,
MODIFY LastName VARCHAR(50) NOT NULL,
MODIFY JoinDate DATE NOT NULL;

ALTER TABLE Payments
MODIFY MemberID INT NOT NULL,
MODIFY PaymentDate DATE NOT NULL,
MODIFY Amount DECIMAL(10,2) NOT NULL;

ALTER TABLE Classes
MODIFY ClassName VARCHAR(50) NOT NULL,
MODIFY ScheduleDateTime DATETIME NOT NULL,
MODIFY Capacity INT NOT NULL;

ALTER TABLE ClassRegistrations
MODIFY MemberID INT NOT NULL,
MODIFY ClassID INT NOT NULL,
MODIFY RegistrationDate DATE NOT NULL;

INSERT INTO MembershipPlans (PlanName, MonthlyFee, DurationMonths, AccessLevel) VALUES
('Basic', 29.99, 1, 'Gym Access'),
('Standard', 49.99, 1, 'Gym + Classes'),
('Premium', 79.99, 1, 'All Access'),
('Student', 24.99, 1, 'Gym Access'),
('Annual Premium', 799.99, 12, 'All Access');

INSERT INTO Members (FirstName, LastName, DateOfBirth, PhoneNumber, Email, JoinDate, MembershipPlanID) VALUES
('John', 'Smith', '2000-05-14', '516-555-1234', 'john.smith@email.com', '2026-01-10', 1),
('Emily', 'Johnson', '1998-08-22', '516-555-5678', 'emily.j@email.com', '2026-02-01', 2),
('Michael', 'Brown', '1995-03-30', '516-555-9012', 'michael.b@email.com', '2026-01-20', 3),
('Sarah', 'Davis', '2001-11-12', '516-555-3456', 'sarah.d@email.com', '2026-02-15', 4),
('David', 'Wilson', '1997-07-09', '516-555-7890', 'david.w@email.com', '2026-03-01', 5),
('Alex', 'Patel', '1999-04-12', '516-555-2221', 'alex.patel@email.com', '2026-03-05', 2),
('Jessica', 'Lopez', '2002-09-18', '516-555-2222', 'jessica.lopez@email.com', '2026-03-10', 1),
('Ryan', 'Chen', '1996-12-03', '516-555-2223', 'ryan.chen@email.com', '2026-03-12', 3),
('Olivia', 'Martinez', '2001-06-25', '516-555-2224', 'olivia.m@email.com', '2026-03-15', 4),
('Daniel', 'Nguyen', '1994-02-08', '516-555-2225', 'daniel.nguyen@email.com', '2026-03-18', 5),
('Liam', 'Hernandez', '1998-01-22', '516-555-4001', 'liam.h@email.com', '2026-04-01', 2),
('Ava', 'Sullivan', '2001-03-11', '516-555-4002', 'ava.s@email.com', '2026-04-01', 1),
('Mason', 'Brooks', '1997-07-19', '516-555-4003', 'mason.b@email.com', '2026-04-02', 3),
('Ella', 'Foster', '1999-10-05', '516-555-4004', 'ella.f@email.com', '2026-04-02', 4),
('Logan', 'Price', '1996-02-28', '516-555-4005', 'logan.p@email.com', '2026-04-03', 5),
('Grace', 'Ward', '2002-06-14', '516-555-4006', 'grace.w@email.com', '2026-04-03', 2),
('Henry', 'Bennett', '1995-09-23', '516-555-4007', 'henry.b@email.com', '2026-04-04', 1),
('Victoria', 'Reyes', '1998-12-30', '516-555-4008', 'victoria.r@email.com', '2026-04-04', 3),
('Sebastian', 'Cruz', '1994-04-17', '516-555-4009', 'sebastian.c@email.com', '2026-04-05', 4),
('Zoe', 'Morgan', '2003-08-09', '516-555-4010', 'zoe.m@email.com', '2026-04-05', 2),
('Julian', 'Bailey', '1997-11-12', '516-555-4011', 'julian.b@email.com', '2026-04-06', 1),
('Aria', 'Rivera', '2000-05-27', '516-555-4012', 'aria.r@email.com', '2026-04-06', 3),
('Wyatt', 'Cooper', '1996-03-03', '516-555-4013', 'wyatt.c@email.com', '2026-04-07', 5),
('Nora', 'Richardson', '1999-09-15', '516-555-4014', 'nora.r@email.com', '2026-04-07', 4),
('Eli', 'Howard', '1998-02-06', '516-555-4015', 'eli.h@email.com', '2026-04-08', 2),
('Lily', 'Ward', '2001-07-21', '516-555-4016', 'lily.w@email.com', '2026-04-08', 1),
('Owen', 'Gonzalez', '1995-10-29', '516-555-4017', 'owen.g@email.com', '2026-04-09', 3),
('Camila', 'Hughes', '2002-01-13', '516-555-4018', 'camila.h@email.com', '2026-04-09', 4),
('Isaac', 'Perry', '1996-06-08', '516-555-4019', 'isaac.p@email.com', '2026-04-10', 5),
('Maya', 'Long', '1998-03-26', '516-555-4020', 'maya.l@email.com', '2026-04-10', 2);


INSERT INTO Classes (ClassName, Instructor, ScheduleDateTime, Capacity) VALUES
('Yoga', 'Anna Lee', '2026-04-05 09:00:00', 20),
('HIIT', 'Chris Miller', '2026-04-05 18:00:00', 15),
('Spin', 'Jessica White', '2026-04-06 07:00:00', 18),
('Pilates', 'David Kim', '2026-04-06 10:00:00', 12),
('Zumba', 'Maria Garcia', '2026-04-07 17:30:00', 25);

INSERT INTO Payments (MemberID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2026-03-01', 29.99, 'Credit Card'),
(2, '2026-03-01', 49.99, 'Debit Card'),
(3, '2026-03-01', 79.99, 'Credit Card'),
(4, '2026-03-01', 24.99, 'Cash'),
(5, '2026-03-01', 799.99, 'Credit Card'),
(6, '2026-03-05', 49.99, 'Credit Card'),
(7, '2026-03-10', 29.99, 'Debit Card'),
(8, '2026-03-12', 79.99, 'Credit Card'),
(9, '2026-03-15', 24.99, 'Cash'),
(10, '2026-03-18', 799.99, 'Credit Card'),
(11, '2026-04-01', 49.99, 'Credit Card'),
(12, '2026-04-01', 29.99, 'Debit Card'),
(13, '2026-04-02', 79.99, 'Credit Card'),
(14, '2026-04-02', 24.99, 'Cash'),
(15, '2026-04-03', 799.99, 'Credit Card'),
(16, '2026-04-03', 49.99, 'Credit Card'),
(17, '2026-04-04', 29.99, 'Debit Card'),
(18, '2026-04-04', 79.99, 'Credit Card'),
(19, '2026-04-05', 24.99, 'Cash'),
(20, '2026-04-05', 49.99, 'Credit Card'),
(21, '2026-04-06', 29.99, 'Credit Card'),
(22, '2026-04-06', 79.99, 'Debit Card'),
(23, '2026-04-07', 799.99, 'Credit Card'),
(24, '2026-04-07', 24.99, 'Cash'),
(25, '2026-04-08', 49.99, 'Credit Card'),
(26, '2026-04-08', 29.99, 'Debit Card'),
(27, '2026-04-09', 79.99, 'Credit Card'),
(28, '2026-04-09', 24.99, 'Cash'),
(29, '2026-04-10', 799.99, 'Credit Card'),
(30, '2026-04-10', 49.99, 'Credit Card');

INSERT INTO ClassRegistrations (MemberID, ClassID, RegistrationDate) VALUES
(1, 1, '2026-04-01'),
(2, 2, '2026-04-01'),
(3, 3, '2026-04-02'),
(4, 4, '2026-04-02'),
(5, 5, '2026-04-03'),
(6, 2, '2026-04-03'),
(7, 1, '2026-04-03'),
(8, 3, '2026-04-04'),
(9, 5, '2026-04-04'),
(10, 4, '2026-04-05'),
(11, 1, '2026-04-05'),
(12, 2, '2026-04-05'),
(13, 3, '2026-04-05'),
(14, 4, '2026-04-06'),
(15, 5, '2026-04-06'),
(16, 1, '2026-04-06'),
(17, 2, '2026-04-07'),
(18, 3, '2026-04-07'),
(19, 4, '2026-04-07'),
(20, 5, '2026-04-07'),
(21, 1, '2026-04-08'),
(22, 2, '2026-04-08'),
(23, 3, '2026-04-08'),
(24, 4, '2026-04-09'),
(25, 5, '2026-04-09'),
(26, 1, '2026-04-09'),
(27, 2, '2026-04-10'),
(28, 3, '2026-04-10'),
(29, 4, '2026-04-10'),
(30, 5, '2026-04-10');

##altered 'classes' table converting 'ScheduleDateTime' into two separate columns scedule_date and schedule_time

SELECT * FROM classes; ##SELECT STATEMENT TO SEE TABLE BEFORE CHANGE NOTICE HOW DATE AND TIME ARE TOGETHER

ALTER TABLE Classes
ADD ScheduleDate DATE,
ADD ScheduleTime TIME;

UPDATE Classes SET 
    ScheduleDate = DATE(ScheduleDateTime),
    ScheduleTime = TIME(ScheduleDateTime);

ALTER TABLE Classes
DROP COLUMN ScheduleDateTime; ##DROPPED COLUMN TO DELETE REDUNDANT DATA

###QUESTION 1 

##SHOW EACH CLASS AND WHO IS REGISTERED FOR IT
CREATE VIEW registered AS
(
SELECT c.ClassID, c.ClassName, c.Instructor, c.ScheduleDate,c.ScheduleTime, m.MemberID, m.FirstName, m.LastName
FROM Classes c
LEFT JOIN ClassRegistrations cr ON c.ClassID = cr.ClassID
LEFT JOIN Members m ON cr.MemberID = m.MemberID
ORDER BY c.classID
);

SELECT * FROM registered
WHERE (ClassName = 'Zumba');

###QUESTION 2

##SHOW MONTHLY REVENUE
CREATE VIEW revenue AS
(
SELECT DATE_FORMAT(PaymentDate, '%Y/%m') AS Month,
SUM(Amount) AS 'Total Revenue'
FROM Payments
GROUP BY DATE_FORMAT(PaymentDate, '%Y/%m')
ORDER BY Month
);

SELECT * FROM revenue;

###QUESTION 3

## DISPLAY DETAILED REVENUE 
CREATE VIEW detail_revenue AS
(
SELECT DATE_FORMAT(p.PaymentDate, '%Y/%m') AS Month, mp.PlanName AS `Plan Name`, SUM(p.Amount) AS `Total Revenue`
FROM Payments p
JOIN Members m ON p.MemberID = m.MemberID
JOIN MembershipPlans mp ON m.MembershipPlanID = mp.MembershipPlanID
GROUP BY Month, mp.PlanName
ORDER BY Month, `Total Revenue` DESC
);

SELECT * FROM detail_revenue
WHERE Month = '2026/04'
ORDER BY MONTH, `Total Revenue` DESC;




