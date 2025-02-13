-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE steps(
	id TINYINT(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    step_type VARCHAR(32),
    step VARCHAR(32),

    UNIQUE INDEX (step, step_type)
);

-- Select entire table
SELECT * FROM steps ORDER BY steps.id;
