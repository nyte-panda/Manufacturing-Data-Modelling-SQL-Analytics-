-- supporting dimension tables


CREATE TABLE part_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE machine_types (
    machine_type_id INT PRIMARY KEY,
    machine_type_name VARCHAR(255) NOT NULL
);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL
);

CREATE TABLE shifts (
    shift_id INT PRIMARY KEY,
    shift_name VARCHAR(100) NOT NULL
);


-- core entity tables


CREATE TABLE parts (
    part_id INT PRIMARY KEY,
    part_name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES part_categories(category_id)
);

CREATE TABLE machines (
    machine_id INT PRIMARY KEY,
    machine_name VARCHAR(255) NOT NULL,
    machine_type_id INT NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY (machine_type_id) REFERENCES machine_types(machine_type_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE operators (
    operator_id INT PRIMARY KEY,
    operator_name VARCHAR(255) NOT NULL,
    shift_id INT NOT NULL,
    FOREIGN KEY (shift_id) REFERENCES shifts(shift_id)
);

CREATE TABLE work_orders (
    work_order_id INT PRIMARY KEY,
    part_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    scheduled_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (part_id) REFERENCES parts(part_id)
);

CREATE TABLE production_runs (
    run_id INT PRIMARY KEY,
    work_order_id INT NOT NULL,
    machine_id INT NOT NULL,
    operator_id INT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    FOREIGN KEY (work_order_id) REFERENCES work_orders(work_order_id),
    FOREIGN KEY (machine_id) REFERENCES machines(machine_id),
    FOREIGN KEY (operator_id) REFERENCES operators(operator_id),
    CHECK (end_time > start_time)
);
