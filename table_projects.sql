-- Working in GOS database
USE abData;

-- Create new table
CREATE TABLE projects(
	id TINYINT (3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(64),
    episode_code SMALLINT(3) UNSIGNED ZEROFILL NOT NULL,
    frames SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    timecode CHAR(11) NOT NULL DEFAULT("00:00:00:00"),
    sequence_count SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    shot_count SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    root_path TEXT,
    date_created DATETIME NOT NULL,
    date_updated DATETIME NOT NULL,
    complete TINYINT UNSIGNED NOT NULL DEFAULT(0),

    INDEX (date_updated),
    UNIQUE INDEX (story_code, episode_code),
    FOREIGN KEY (story_code)  REFERENCES storylines (story_code)
);


UPDATE projects
SET projects.root_path = "Default/Root",
WHERE projects.id = 1;


-- Select entire table
SELECT * FROM projects WHERE id = 1 ORDER BY project.id;


