-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE asset_versions(
	id MEDIUMINT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    asset_id MEDIUMINT(5) UNSIGNED ZEROFILL NOT NULL,
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
    FOREIGN KEY (asset_id) REFERENCES assets (id),
    FOREIGN KEY (step_id) REFERENCES steps (id)
);

-- Insert values
INSERT INTO asset_versions(
	asset_id, 
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
    "Default/Asset/Version/Path", 
    "Default/Asset/Version/Preview/Path",
    true,
    "Default/Asset/Version/Published/Path",
    CURRENT_TIMESTAMP()
);

-- Select entire table
SELECT * FROM asset_versions;

-- Delete all table contents
DELETE FROM asset_versions;

-- Delete entire table
DROP TABLE asset_versions;

ALTER TABLE asset_versions
ADD COLUMN size BIGINT UNSIGNED DEFAULT(0) AFTER version_path;
-- FOREIGN KEY(story_id)
-- REFERENCES storylines(id);
