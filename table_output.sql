-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE output(
	id MEDIUMINT(9) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    output_id TINYINT(3) UNSIGNED ZEROFILL NOT NULL,
    version_type Enum("Asset", "Shot", "Episode", "Default"),
    version_id MEDIUMINT(8) UNSIGNED ZEROFILL NOT NULL,
    output_path TEXT NOT NULL,
    size BIGINT UNSIGNED DEFAULT(0),
    date_created DATETIME NOT NULL,
    flags TEXT,
    
    INDEX (date_created),
    UNIQUE INDEX (version_type, version_id),
    FOREIGN KEY (output_id) REFERENCES output_types (id),
    FOREIGN KEY (version_id) REFERENCES asset_versions (id)
);

-- Insert values
INSERT INTO output(
	output_id, 
    version_type,
    version_id,
    output_path,
    date_created,
    flags
)
VALUES(
	1, 
    "Default",
    1,
    "Default/Output/Path", 
    CURRENT_TIMESTAMP(),
    "Default, TEST"
);

-- Select entire table
SELECT * FROM output;

-- Delete all table contents
DELETE FROM output;

-- Delete entire table
DROP TABLE output;

ALTER TABLE asset_versions
ADD COLUMN size BIGINT UNSIGNED DEFAULT(0) AFTER version_path;
-- FOREIGN KEY(story_id)
-- REFERENCES storylines(id);
