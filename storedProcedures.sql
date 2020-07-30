-- stored procedures/functions
USE gos;

SELECT * FROM steps ORDER BY id;
-- create new step
DELIMITER //
CREATE PROCEDURE NewStep(
	IN step_type_arg VARCHAR(32),
	IN step_arg VARCHAR(32)
)
BEGIN
	INSERT INTO steps(step_type, step)
	VALUES (step_type_arg, step_arg);
END //
DELIMITER ;

CALL NewStep("", "");


SELECT * FROM storylines ORDER BY story_code;
-- create new storyline
DELIMITER //
CREATE PROCEDURE NewStoryline(
	IN story_code_arg CHAR(1),
	IN label_arg VARCHAR(32),
    IN story_path_arg TEXT
)
BEGIN
	INSERT INTO storylines(story_code, label, story_path)
	VALUES (story_code_arg, label_arg, story_path_arg);
END //
DELIMITER ;

CALL NewStoryline("Z", "Default", "Default/Storyline/Path");


SELECT * FROM asset_types ORDER BY id;
-- create new asset_type
DELIMITER //
CREATE PROCEDURE NewAssetType(
	IN asset_code_arg ENUM("CHR", "VHL", "PRP", "SET", "SFX", "CAM", "LGT", "DEF"),
	IN asset_type_arg ENUM("Character", "Vehicle", "Prop", "Set", "FX", "Camera", "Light", "Default")
)
BEGIN
	INSERT INTO asset_types(asset_code, asset_type)
	VALUES (asset_code_arg, asset_type_arg);
END //
DELIMITER ;

CALL NewAssetType("DEF", "Default");


SELECT * FROM episodes ORDER BY id;
-- create new episode
DELIMITER //
CREATE PROCEDURE NewEpisode(
	IN label_arg VARCHAR(64), 
    IN story_code_arg CHAR(1), 
    IN episode_code_arg SMALLINT(3) UNSIGNED ZEROFILL,
    IN episode_path_arg TEXT
)
BEGIN
    INSERT INTO episodes(label, story_code, episode_code, episode_path, date_created, date_updated)
    VALUES(label_arg, story_code_arg, episode_code_arg, episode_path_arg, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
END //
DELIMITER ;

CALL NewEpisode("Default Episode", "Z", 999, "Default/Episode/Path");


SELECT * FROM sequences ORDER BY id;
-- create new sequence
DELIMITER //
CREATE PROCEDURE NewSequence(
    IN story_code_arg CHAR(1), 
    IN episode_id_arg SMALLINT(3) UNSIGNED ZEROFILL,
    IN sequence_code_arg TINYINT(2) UNSIGNED ZEROFILL,
    IN sequence_order_arg TINYINT(2) UNSIGNED ZEROFILL
)
BEGIN
    INSERT INTO sequences(story_code, episode_id, sequence_code, sequence_order)
    VALUES(story_code_arg, episode_id_arg, sequence_code_arg, sequence_order_arg);
END //
DELIMITER ;

CALL NewSequence("Z", 0001, 99, 99);


SELECT * FROM shots ORDER BY id;
-- create new shot
DELIMITER //
CREATE PROCEDURE NewShot(
    IN story_code_arg CHAR(1), 
    IN episode_id_arg SMALLINT(3) UNSIGNED ZEROFILL,
    IN sequence_id_arg TINYINT(2) UNSIGNED ZEROFILL,
    IN shot_code_arg SMALLINT(4) UNSIGNED ZEROFILL,
    IN shot_order_arg SMALLINT(4) UNSIGNED ZEROFILL,
    IN shot_path_arg TEXT
)
BEGIN
	-- Set Variables
	SET @story_var = story_code_arg;
	SET @ep_var = GetEpisode(episode_id_arg);
	SET @sq_var = GetSequence(sequence_id_arg);
	SET @sh_var = shot_code_arg;
	SET @all_var = CONCAT(CAST(@story_var AS CHAR), "-", CAST(@ep_var AS CHAR), "-", CAST(@sq_var AS CHAR), "-", CAST(@sh_var as CHAR));

    INSERT INTO shots(story_code, episode_id, sequence_id, shot_code, shot_name, shot_order, shot_path, date_created, date_updated)
    VALUES(story_code_arg, episode_id_arg, sequence_id_arg, shot_code_arg, @all_var, shot_order_arg, shot_path_arg, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
END //
DELIMITER ;

CALL NewShot("Z", 1, 1, 9999, 9999, "Default/Episode/Shot/Path");


SELECT * FROM assets ORDER BY id;
-- create new sequence
DELIMITER //
CREATE PROCEDURE NewAsset(
	IN asset_code_arg ENUM("CHR", "VHL", "PRP", "SET", "SFX", "CAM", "LGT", "DEF"),
    IN asset_name_arg VARCHAR(64),
    IN asset_variant_arg VARCHAR(64),
	IN asset_path_arg TEXT
)
BEGIN
    INSERT INTO assets(asset_code, asset_name, asset_variant, asset_path, date_created, date_updated)
    VALUES(asset_code_arg, asset_name_arg, asset_variant_arg, asset_path_arg, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
END //
DELIMITER ;

CALL NewAsset("Z", 0001, 99, 99);


-- create new version
DELIMITER //
CREATE PROCEDURE NewVersion(
	IN label_arg VARCHAR(64), 
    IN story_code_arg CHAR(1), 
    IN episode_code_arg SMALLINT(3) UNSIGNED ZEROFILL
    -- todo: episode path? get path from template?
)
BEGIN
	INSERT INTO episodes(label, story_code, episode_code, episode_path, date_created, date_updated)
    VALUES(label_arg, story_code_arg, episode_code_arg, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
END //
DELIMITER ;