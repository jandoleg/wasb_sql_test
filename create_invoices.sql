USE memory.default;

CREATE TABLE SExI_INVOICE (
    supplier_id TINYINT,
    invoice_amount DECIMAL(8, 2),
    due_date DATE
);

CREATE TABLE SExI_SUPPLIER (
    supplier_id TINYINT,
    name VARCHAR
);

INSERT INTO sexi_invoice (supplier_id, invoice_amount, due_date) VALUES
    (1, 6000, cast('2025-06-30' as DATE)),
    (2, 2000,  cast('2025-05-31' as DATE)),
    (2, 1500,  cast('2025-06-30' as DATE)),
    (3, 500,  cast('2025-04-30' as DATE)),
    (4, 6000,  cast('2025-06-30' as DATE)),
    (5, 4000,  cast('2025-09-30' as DATE));

INSERT INTO SExI_SUPPLIER (supplier_id, name) VALUES
(1, 'Party Animals'),
(2, 'Catering Plus'),
(3, 'Daves Discos'),
(4, 'Entertainment tonight'),
(5, 'Ice Ice Baby');
