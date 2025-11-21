SELECT *
FROM sales_contracts
JOIN vehicles
ON sales_contracts.VIN = vehicles.VIN
JOIN inventory
ON vehicles.VIN = inventory.VIN
JOIN dealership
ON inventory.dealership_id = dealership.dealership_id
WHERE dealership.name = 'CarMax Auto Center'
AND sales_contracts.sale_date BETWEEN '2024-01-01' AND '2024-12-31';