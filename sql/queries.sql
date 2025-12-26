-- total number of production runs per machine type

SELECT
    mt.machine_name,
    COUNT(pr.run_id) AS  total_runs,
FROM production_runs pr 
JOIN machines mt ON pr.machine_id = mt.machine_id
GROUP BY mt.machine_name
ORDER BY total_runs DESC;

-- average production run duration (hours) by machine type

SELECT
    mt.machine_name,
    ROUND(
        AVG(EXTRACT(EPOCH FROM (pr.end_time - pr.start_time)) / 3600),
        2
    ) AS avg_runtime_hours
FROM production_runs pr
JOIN machines m on pr.machine_id = m.machine_id
JOIN machine_types mt ON m.machine_type_id = mt.machine_type_id
GROUP BY mt.machine_type_name
ORDER BY avg_runtime_hours DESC;

-- number of production runs handled by each operator

SELECT
    o.operator_name
    COUNT(pr.run_id) AS total_runs
FROM production_runs pr
JOIN operators o ON pr.operator_id = o.operator_id
GROUP BY o.operator_name
ORDER BY runs_complete DESC;

--total production runs per location 

SELECT
    l.location_name,
    COUNT(pr.run_id) AS total_runs
FROM production_runs pr
JOIN machines m ON pr.machine_id = m.machine_id
JOIN locations l ON m.location_id = l.location_id
GROUP BY l.location_name
ORDER BY total_runs DESC;

-- top 10 longest production runs

SELECT
    pr.run_id,
    m.machine_name,
    ROUND(
        EXTRACT(EPOCH FROM (pr.end_time - pr.start_time)) / 3600,
        2
    ) AS duration_hours
FROM production_runs pr
JOIN machines m ON pr.machine_id = m.machine_id
ORDER BY duration_hours DESC
LIMIT 10;


-- daily count of production runs

SELECT
    DATE(pr.start_time) AS production_date,
    COUNT(*) AS total_runs
FROM production_runs pr
GROUP BY production_date
ORDER BY production_date;


-- distribution of work order statuses

SELECT
    status,
    COUNT(*) AS total_orders
FROM work_orders
GROUP BY status;


-- average production run duration by shift

SELECT
    s.shift_name,
    ROUND(
        AVG(EXTRACT(EPOCH FROM (pr.end_time - pr.start_time)) / 3600),
        2
    ) AS avg_runtime_hours
FROM production_runs pr
JOIN operators o ON pr.operator_id = o.operator_id
JOIN shifts s ON o.shift_id = s.shift_id
GROUP BY s.shift_name
ORDER BY avg_runtime_hours DESC;


-- parts with the highest number of production runs

SELECT
    p.part_name,
    COUNT(pr.run_id) AS total_runs
FROM production_runs pr
JOIN work_orders wo ON pr.work_order_id = wo.work_order_id
JOIN parts p ON wo.part_id = p.part_id
GROUP BY p.part_name
ORDER BY total_runs DESC
LIMIT 10;


-- total machine utilization time (hours)

SELECT
    m.machine_name,
    ROUND(
        SUM(EXTRACT(EPOCH FROM (pr.end_time - pr.start_time)) / 3600),
        2
    ) AS total_runtime_hours
FROM production_runs pr
JOIN machines m ON pr.machine_id = m.machine_id
GROUP BY m.machine_name
ORDER BY total_runtime_hours DESC;


