-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE shot_contents(
	shot_id MEDIUMINT(6) UNSIGNED ZEROFILL NOT NULL ,
    asset_id MEDIUMINT(5) UNSIGNED ZEROFILL NOT NULL,
	asset_code ENUM("CHR", "VHL", "PRP", "SET", "SFX", "CAM", "LGT", "DEF"),
    amount SMALLINT UNSIGNED NOT NULL DEFAULT(0),
    version MEDIUMINT(3) UNSIGNED ZEROFILL NOT NULL,
    latest MEDIUMINT(3) UNSIGNED ZEROFILL NOT NULL,

    FOREIGN KEY (shot_id) REFERENCES shots (id),
    FOREIGN KEY (asset_id) REFERENCES assets (id),
    FOREIGN KEY (asset_code) REFERENCES asset_types (asset_code),
    PRIMARY KEY (shot_id, asset_id)
);

SET @latest_var = (SELECT MAX(version) FROM asset_versions);

-- Insert values
INSERT INTO shot_contents(
	shot_id,
    asset_id,
    asset_code,
    amount,
    version,
    latest
)
VALUES(
	1, 
    1, 
    "DEF",
    1, 
    999, 
    @latest_var
);

-- Select entire table
SELECT * FROM shot_contents;

-- Delete all table contents
DELETE FROM shot_contents;

-- Delete entire table
DROP TABLE shot_contents;

-- ALTER TABLE episodes
-- ADD CONSTRAINT FK_storyline_constraint
-- FOREIGN KEY(story_id)
-- REFERENCES storylines(id);
