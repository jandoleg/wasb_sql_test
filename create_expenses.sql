USE memory.default;

CREATE TABLE EXPENSE (
                 item_id TINYINT,
                 employee_id TINYINT,
                 items ARRAY<VARCHAR>,
                 unit_price DECIMAL(8,2),
                 quantity INT
             );

INSERT INTO EXPENSE (item_id , employee_id, items, unit_price, quantity) VALUES
(1, 3, CAST(JSON '["Drinks", "lots of drinks"]' as ARRAY(varchar)), 6.50, 14),
(2, 3, CAST(JSON '["More Drinks"]' as ARRAY(varchar)), 11.00, 20),
(3, 3, CAST(JSON '["So Many Drinks!"]' as ARRAY(varchar)), 22.00, 18),
(4, 3, CAST(JSON '["I bought everyone in the bar a drink!"]' as ARRAY(varchar)), 13.00, 75),
(5, 9, CAST(JSON '["Flights from Mexico back to New York"]' as ARRAY(varchar)), 300, 1),
(6, 4, CAST(JSON '["Ubers to get us all home"]' as ARRAY(varchar)), 40, 9),
(7, 2, CAST(JSON '["I had too much fun and needed something to eat"]' as ARRAY(varchar)), 17.50, 4);
