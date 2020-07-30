-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE shots(
	id MEDIUMINT(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    story_code CHAR(1) NOT NULL,
    episode_id SMALLINT(4) UNSIGNED ZEROFILL NOT NULL,
    sequence_id SMALLINT(4) UNSIGNED ZEROFILL NOT NULL,
    shot_code SMALLINT(4) UNSIGNED ZEROFILL NOT NULL,
    shot_name CHAR(13) NOT NULL,
    shot_order SMALLINT(4) UNSIGNED ZEROFILL NOT NULL,
    frames SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    timecode CHAR(11) NOT NULL DEFAULT("00:00:00:00"),
    shot_path TEXT,
    description_path TEXT,
    preview_path TEXT,
    published_path TEXT,
    date_created DATETIME NOT NULL,
    date_updated DATETIME NOT NULL,
    complete TINYINT UNSIGNED NOT NULL DEFAULT(0),
    
    INDEX (date_updated),
    UNIQUE INDEX (shot_order),
    UNIQUE INDEX (shot_name),
    FOREIGN KEY (story_code) REFERENCES storylines (story_code),
    FOREIGN KEY (episode_id) REFERENCES episodes (id),
    FOREIGN KEY (sequence_id) REFERENCES sequences (id)
);

-- Set Variables
SET @story_var = "Z";
SET @episode_var = 999;
SET @sequence_var = 99;
SET @shot_var = 9990;
SET @all_var = CONCAT(CAST(@story_var AS CHAR), "-", CAST(@episode_var AS CHAR), "-", CAST(@sequence_var AS CHAR), "-", CAST(@shot_var as CHAR));


UPDATE shots
SET shots.description_path = "Default/Episode/Shot/Description/Path",
	shots.preview_path = "Default/Episode/Shot/Preview/Path",
	shots.published_path = "Default/Episode/Shot/Published/Path"
WHERE shots.id = 1;


-- Select entire table
SELECT * FROM shots ORDER BY shot_name;

