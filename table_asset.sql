-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE assets(
	id MEDIUMINT(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    asset_code ENUM("CHR", "VHL", "PRP", "SET", "SFX", "CAM", "LGT", "DEF", "MOV", "IMG"),
    asset_name VARCHAR(64) NOT NULL,
    asset_variant VARCHAR(64),
    asset_path TEXT,
    description_path TEXT,
    preview_path TEXT,
    published_path TEXT,
    date_created DATETIME NOT NULL,
    date_updated DATETIME NOT NULL,
    complete TINYINT UNSIGNED NOT NULL DEFAULT(0),

    INDEX (date_updated),
    UNIQUE INDEX (asset_name),
    FOREIGN KEY (asset_code) REFERENCES asset_types (asset_code),
    FOREIGN KEY (step_id) REFERENCES steps (id)
);


-- Select entire table
SELECT * FROM assets ORDER BY assets.id;

