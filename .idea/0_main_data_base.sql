-- Create database cardealership;
USE cardealership;

CREATE TABLE dealership (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL
);
INSERT INTO dealership (name, address, phone) VALUES
('CarMax Auto Center', '123 Maple Street', '555-123-4567'),
('Premium Motors', '78 Oak Avenue', '555-987-6543'),
('Sunshine Autos', '450 Pine Road', '555-222-3344'),
('Metro City Cars', '900 Downtown Blvd', '555-444-8899'),
('Elite Auto Plaza', '250 Horizon Drive', '555-101-2020'),
('Westside Dealership', '19 Sunset Lane', '555-303-4040'),
('North Ridge Autos', '765 Mountain View', '555-505-6060'),
('Speedline Motors', '88 Highway Road', '555-707-8080');

CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(30) NOT NULL,
    model VARCHAR(30) NOT NULL,
    year INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    color VARCHAR(20) NOT NULL,
    sold BOOLEAN DEFAULT FALSE
);
INSERT INTO vehicles (VIN, make, model, year, price, color, sold) VALUES
('1HGCM82633A123456', 'Honda', 'Accord', 2020, 22000.00, 'Blue', FALSE),
('2FTRX18W1XCA12345', 'Ford', 'F-150', 2019, 31000.00, 'Black', FALSE),
('5YJ3E1EA7KF123456', 'Tesla', 'Model 3', 2021, 45000.00, 'White', FALSE),
('1C4RJEBG8JC123456', 'Jeep', 'Grand Cherokee', 2018, 28000.00, 'Gray', FALSE),
('3FA6P0H70JR123456', 'Ford', 'Fusion', 2019, 19000.00, 'Red', FALSE),
('1N4AL3AP4JC123456', 'Nissan', 'Altima', 2020, 21000.00, 'Silver', FALSE),
('3VW2K7AJ5HM123456', 'Volkswagen', 'Jetta', 2017, 15000.00, 'White', FALSE),
('1G1ZD5STXJF123456', 'Chevrolet', 'Malibu', 2020, 23000.00, 'Blue', FALSE);

CREATE TABLE inventory (
    dealership_id INT NOT NULL,
    VIN VARCHAR(17) NOT NULL,
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(1, '2FTRX18W1XCA12345'),
(2, '5YJ3E1EA7KF123456'),
(3, '1C4RJEBG8JC123456'),
(4, '3FA6P0H70JR123456'),
(5, '1N4AL3AP4JC123456'),
(6, '3VW2K7AJ5HM123456'),
(7, '1G1ZD5STXJF123456');

CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    buyer_name VARCHAR(50) NOT NULL,
    sale_date DATE NOT NULL,
    sale_price DECIMAL(10,2) NOT NULL,
    financing BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
INSERT INTO sales_contracts (VIN, buyer_name, sale_date, sale_price, financing) VALUES
('1HGCM82633A123456', 'John Smith', '2024-02-01', 21500.00, TRUE),
('3FA6P0H70JR123456', 'Maria Lopez', '2024-03-15', 18500.00, FALSE);

-- Mark sold vehicles
-- UPDATE vehicles SET sold = TRUE WHERE VIN = '1HGCM82633A123456';
-- UPDATE vehicles SET sold = TRUE WHERE VIN = '3FA6P0H70JR123456'; 99.99);
