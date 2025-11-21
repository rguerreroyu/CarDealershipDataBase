SELECT *
 FROM inventory
 JOIN dealership
 ON inventory.dealership_id = dealership.dealership_id
 WHERE VIN = '1C4RJEBG8JC123456'
 