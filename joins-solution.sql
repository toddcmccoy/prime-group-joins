-- Get all customers and their addresses:
SELECT * FROM "customers" JOIN "addresses" 
ON "addresses"."customer_id" = "customers"."id";

-- Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders" JOIN "line_items" ON "line_items"."order_id" = "orders"."id";

-- Which warehouses have cheetos?
SELECT * FROM "products" JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products" . "id" 
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "products"."description" = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT * FROM "products" JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products" . "id" 
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "products"."description" = 'diet pepsi';

-- Get the number of orders for each customer. 
-- NOTE: It is OK if those without orders are not included in results. Not sure on this one
SELECT sum("address_id") FROM "customers" JOIN "addresses" 
ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
WHERE "orders"."address_id" = "addresses"."id";

-- How many customers do we have?
SELECT count(*) FROM "customers";

-- How many products do we carry?
SELECT count(*) FROM "products";

-- What is the total available on hand quantity of diet pepsi?
SELECT sum("on_hand") FROM "products" JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products" . "id" 
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "products"."description" = 'diet pepsi';