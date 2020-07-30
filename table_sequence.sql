-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE sequences (
    id SMALLINT(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    story_code CHAR(1) NOT NULL,
    episode_id SMALLINT(4) UNSIGNED ZEROFILL NOT NULL,
    sequence_code TINYINT(2) UNSIGNED ZEROFILL NOT NULL,
    sequence_order TINYINT(2) UNSIGNED ZEROFILL NOT NULL,
    frames SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    timecode CHAR(11) NOT NULL DEFAULT("00:00:00:00"),
    shot_count SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    complete TINYINT UNSIGNED NOT NULL DEFAULT(0),

    INDEX (sequence_code),
    FOREIGN KEY (story_code)  REFERENCES storylines (story_code),
    FOREIGN KEY (episode_id)  REFERENCES episodes (id)
);


-- Select entire table
SELECT * FROM sequences ORDER BY sequences.story_code, sequences.sequence_code;

