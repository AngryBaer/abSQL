-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE episode_versions(
	id MEDIUMINT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    story_code CHAR(1) NOT NULL,
    episode_id SMALLINT(4) UNSIGNED ZEROFILL NOT NULL,
    step_id TINYINT(3) UNSIGNED ZEROFILL NOT NULL,
    version MEDIUMINT(3) UNSIGNED ZEROFILL NOT NULL,
    version_path TEXT NOT NULL,
    date_created DATETIME NOT NULL,
    
    INDEX (date_created),
	FOREIGN KEY (story_code) REFERENCES storylines (story_code),
    FOREIGN KEY (episode_id) REFERENCES episodes (id),
    FOREIGN KEY (step_id) REFERENCES steps (id)
);

-- Insert values
INSERT INTO episode_versions(
	story_code, 
    episode_id, 
    step_id,
    version,
    version_path,
    date_created
)
VALUES(
    "Z",
    1, 
    1,
    999, 
    "Default/Episode/Version/Path",
    CURRENT_TIMESTAMP()
);

-- Select entire table
SELECT * FROM episode_versions;

-- Delete all table contents
DELETE FROM episode_versions;

-- Delete entire table
DROP TABLE episode_versions;


