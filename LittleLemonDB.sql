USE `LittleLemonDM`;

-- Insert data into Bookings table
INSERT INTO `Bookings` (`BookingDate`, `BookingNumber`) VALUES
('2025-07-01', 101),
('2025-07-01', 102),
('2025-07-02', 103),
('2025-07-03', 104),
('2025-07-04', 105),
('2025-07-05', 106),
('2025-07-05', 107),
('2025-07-06', 108),
('2025-07-07', 109),
('2025-07-08', 110);

-- Insert data into Orders table
INSERT INTO `Orders` (`OrderDate`, `OrderQuantity`, `TotalCost`) VALUES
('2025-07-01', 2, 35),
('2025-07-01', 3, 50),
('2025-07-02', 1, 20),
('2025-07-02', 4, 75),
('2025-07-03', 2, 40),
('2025-07-04', 1, 15),
('2025-07-04', 3, 60),
('2025-07-05', 2, 30),
('2025-07-06', 5, 100),
('2025-07-07', 1, 25);

-- Insert data into OrderDeliveryDate table (assuming OrderIDs exist from previous inserts)
INSERT INTO `OrderDeliveryDate` (`DeliveryDate`, `DeliveryStatusl`, `OderID`) VALUES
('2025-07-02', 'Delivered', 1),
('2025-07-02', 'Pending', 2),
('2025-07-03', 'Delivered', 3),
('2025-07-03', 'In Transit', 4),
('2025-07-04', 'Delivered', 5),
('2025-07-05', 'Pending', 6),
('2025-07-05', 'Delivered', 7),
('2025-07-06', 'In Transit', 8),
('2025-07-07', 'Delivered', 9),
('2025-07-08', 'Pending', 10);

-- Insert data into CustomerDetails table
INSERT INTO `CustomerDetails` (`FirstName`, `LastName`, `Email`, `PhoneNumber`) VALUES
('Alice', 'Smith', 'alice.smith@example.com', '555-123-4567'),
('Bob', 'Johnson', 'bob.j@example.com', '555-987-6543'),
('Charlie', 'Brown', 'charlie.b@example.com', '555-111-2222'),
('Diana', 'Prince', 'diana.p@example.com', '555-333-4444'),
('Eve', 'Davis', 'eve.d@example.com', '555-555-6666'),
('Frank', 'White', 'frank.w@example.com', '555-777-8888'),
('Grace', 'Taylor', 'grace.t@example.com', '555-999-0000'),
('Henry', 'Miller', 'henry.m@example.com', '555-222-3333'),
('Ivy', 'Moore', 'ivy.m@example.com', '555-444-5555'),
('Jack', 'Hall', 'jack.h@example.com', '555-666-7777');

-- Insert data into Menu table
INSERT INTO `Menu` (`ItemID`, `Category`, `Price`, `Desciption`) VALUES
('Mains-001', 'Mains', 25.00, 'Grilled Salmon'),
('Starter-001', 'Starters', 8.50, 'Bruschetta'),
('Dessert-001', 'Desserts', 10.00, 'Cheesecake'),
('Mains-002', 'Mains', 22.00, 'Pasta Primavera'),
('Drinks-001', 'Drinks', 4.00, 'Orange Juice'),
('Starter-002', 'Starters', 9.00, 'Caprese Salad'),
('Dessert-002', 'Desserts', 9.50, 'Tiramisu'),
('Mains-003', 'Mains', 18.00, 'Vegetable Curry'),
('Drinks-002', 'Drinks', 5.00, 'Espresso'),
('Mains-004', 'Mains', 30.00, 'Steak Frites');

-- Insert data into StaffInformation table
INSERT INTO `StaffInformation` (`FirstName`, `LastName`, `Role`, `Salary`) VALUES
('John', 'Doe', 'Manager', 60000.00),
('Jane', 'Smith', 'Chef', 55000.00),
('Peter', 'Jones', 'Waiter', 30000.00),
('Mary', 'Brown', 'Waiter', 28000.00),
('Chris', 'Green', 'Kitchen Staff', 25000.00),
('Anna', 'White', 'Hostess', 32000.00),
('Tom', 'Black', 'Chef', 52000.00),
('Sarah', 'Grey', 'Waiter', 29000.00),
('Michael', 'Blue', 'Manager', 62000.00),
('Laura', 'Red', 'Kitchen Staff', 26000.00);


DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(OrderQuantity) AS MaxOrderQuantity
    FROM Orders;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ManageBooking(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_BookingNumber INT,
    IN p_TableNumber INT,
    IN p_Task VARCHAR(10)
)
BEGIN
    IF p_Task = 'Add' THEN
        INSERT INTO Bookings (CustomerID, BookingDate, BookingNumber, TableNumber)
        VALUES (p_CustomerID, p_BookingDate, p_BookingNumber, p_TableNumber);
    ELSEIF p_Task = 'Update' THEN
        UPDATE Bookings
        SET
            CustomerID = p_CustomerID,
            BookingDate = p_BookingDate,
            BookingNumber = p_BookingNumber,
            TableNumber = p_TableNumber
        WHERE BookingID = p_BookingID;
    ELSEIF p_Task = 'Delete' THEN
        DELETE FROM Bookings
        WHERE BookingID = p_BookingID;
    ELSE
        -- Handle invalid task by signaling an SQL exception
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid task provided. Use "Add", "Update", or "Delete".';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_BookingNumber INT,
    IN p_TableNumber INT
)
BEGIN
    UPDATE Bookings
    SET
        CustomerID = p_CustomerID,
        BookingDate = p_BookingDate,
        BookingNumber = p_BookingNumber,
        TableNumber = p_TableNumber
    WHERE BookingID = p_BookingID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_BookingNumber INT,
    IN p_TableNumber INT
)
BEGIN
    UPDATE Bookings
    SET
        CustomerID = p_CustomerID,
        BookingDate = p_BookingDate,
        BookingNumber = p_BookingNumber,
        TableNumber = p_TableNumber
    WHERE BookingID = p_BookingID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_BookingNumber INT,
    IN p_TableNumber INT
)
BEGIN
    UPDATE Bookings
    SET
        CustomerID = p_CustomerID,
        BookingDate = p_BookingDate,
        BookingNumber = p_BookingNumber,
        TableNumber = p_TableNumber
    WHERE BookingID = p_BookingID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE AddBooking(
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_BookingNumber INT,
    IN p_TableNumber INT
)
BEGIN
    INSERT INTO Bookings (CustomerID, BookingDate, BookingNumber, TableNumber)
    VALUES (p_CustomerID, p_BookingDate, p_BookingNumber, p_TableNumber);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CancelBooking(
    IN p_BookingID INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = p_BookingID;
END //
DELIMITER ;
