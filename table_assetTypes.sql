-- Working in GOS database
USE gos;

-- Create new table
CREATE TABLE asset_types(
	id TINYINT(2) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY,
    asset_code ENUM("CHR", "VHL", "PRP", "SET", "SFX", "CAM", "LGT", "DEF"),
    asset_type ENUM("Character", "Vehicle", "Prop", "Set", "FX", "Camera", "Light", "Default"),
    total_number SMALLINT NOT NULL DEFAULT(0),

    UNIQUE INDEX (asset_code)
);

-- Select entire table
SELECT * FROM asset_types ORDER BY asset_types.id;
