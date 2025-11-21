SELECT make, model, name
FROM dealership
   JOIN inventory USING (dealership_id)
   JOIN vehicles USING (VIN)
   LEFT JOIN sales_contracts USING (VIN)
   WHERE dealership.name = 'Sunshine Autos'
