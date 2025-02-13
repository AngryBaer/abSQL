-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE storylines(
	story_code CHAR(1) NOT NULL PRIMARY KEY,
    label VARCHAR(32),
    story_path TEXT
);

-- Select entire table
SELECT * FROM storylines;
