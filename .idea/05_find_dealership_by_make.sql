SELECT *
 FROM inventory
 JOIN dealership
 ON inventory.dealership_id = dealership.dealership_id
 JOIN vehicles
 ON vehicles.VIN = inventory.VIN
 WHERE make = 'Jeep'