-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE output_types(
	id TINYINT(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    step_id TINYINT(3) UNSIGNED ZEROFILL NOT NULL,
    output_type VARCHAR(32),
    output_engine VARCHAR(32),
    file_type VARCHAR(32),
    file_space ENUM("File", "Folder"),

    UNIQUE INDEX (output_type, output_engine, file_type),
    FOREIGN KEY (step_id) REFERENCES steps (id)
);

-- Select entire table
SELECT * FROM output_types;
