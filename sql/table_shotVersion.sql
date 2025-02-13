-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE shot_versions(
	id MEDIUMINT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    shot_id MEDIUMINT(5) UNSIGNED ZEROFILL NOT NULL,
    step_id TINYINT(3) UNSIGNED ZEROFILL NOT NULL,
    version_variant CHAR(1) NOT NULL DEFAULT("A"),
    version MEDIUMINT(3) UNSIGNED ZEROFILL NOT NULL,
    version_path TEXT NOT NULL,
    size BIGINT UNSIGNED DEFAULT(0),
    preview_path TEXT,
    published BOOLEAN NOT NULL,
    published_path TEXT,
    date_created DATETIME NOT NULL,
    
    INDEX (date_created),
    INDEX (published),
    FOREIGN KEY (shot_id) REFERENCES shots (id),
    FOREIGN KEY (step_id) REFERENCES steps (id)
);

-- Insert values
INSERT INTO shot_versions(
	shot_id, 
    step_id, 
    version_variant,
    version,
    version_path,
    preview_path,
    published,
    published_path,
    date_created
)
VALUES(
	1, 
    1, 
    "Z",
    999, 
    "Default/Shot/Version/Path", 
    "Default/Shot/Version/Preview/Path",
    true,
    "Default/Asset/Version/Published/Path",
    CURRENT_TIMESTAMP()
);

-- Select entire table
SELECT * FROM shot_versions;

-- Delete all table contents
DELETE FROM shot_versions;

-- Delete entire table
DROP TABLE shot_versions;

ALTER TABLE shot_versions
ADD COLUMN size BIGINT UNSIGNED DEFAULT(0) AFTER version_path;
-- FOREIGN KEY(story_id)
-- REFERENCES storylines(id);
