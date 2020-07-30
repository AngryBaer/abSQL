-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE episodes(
	id SMALLINT(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(64),
    story_code CHAR(1) NOT NULL,
    episode_code SMALLINT(3) UNSIGNED ZEROFILL NOT NULL,
    frames SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    timecode CHAR(11) NOT NULL DEFAULT("00:00:00:00"),
    sequence_count SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    shot_count SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    episode_path TEXT,
    script_path TEXT,
    edit_path TEXT,
    export_path TEXT,
    date_created DATETIME NOT NULL,
    date_updated DATETIME NOT NULL,
    complete TINYINT UNSIGNED NOT NULL DEFAULT(0),
    
    INDEX (date_updated),
    UNIQUE INDEX (story_code, episode_code),
    FOREIGN KEY (story_code)  REFERENCES storylines (story_code)
);


UPDATE episodes
SET episodes.script_path = "Default/Episode/Script/Path",
	episodes.edit_path = "Default/Episode/Edit/Path",
	episodes.script_path = "Default/Episode/Script/Path",
    episodes.export_path = "Default/Episode/Export/Path"
WHERE episodes.id = 1;


-- Select entire table
SELECT * FROM episodes WHERE id = 1 ORDER BY episodes.id;


