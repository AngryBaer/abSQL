
-- stored functions
USE gos;


-- get episode number from id
DELIMITER //

CREATE FUNCTION GetEpisode(id_var SMALLINT(4) UNSIGNED)
RETURNS SMALLINT(3) UNSIGNED ZEROFILL
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE episode_var SMALLINT(3) UNSIGNED ZEROFILL;

    SELECT episode_code
    INTO episode_var
    FROM episodes
    WHERE id = id_var;

    RETURN episode_var;
END //

DELIMITER ;

SELECT GetEpisode(1);

-- get sequence number from id
DELIMITER //

CREATE FUNCTION GetSequence(id_var SMALLINT(4) UNSIGNED)
RETURNS TINYINT(2) UNSIGNED ZEROFILL
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE sequence_var TINYINT(2) UNSIGNED ZEROFILL;

    SELECT sequence_code
    INTO sequence_var
    FROM sequences
    WHERE id = id_var;

    RETURN sequence_var;
END //

DELIMITER ;

SELECT GetSequence(1);


-- get shot number from id
DELIMITER //

CREATE FUNCTION GetShot(id_var SMALLINT(4) UNSIGNED)
RETURNS SMALLINT(4) UNSIGNED ZEROFILL
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE shot_var SMALLINT(4) UNSIGNED ZEROFILL;

    SELECT shot_code
    INTO shot_var
    FROM shots
    WHERE id = id_var;

    RETURN shot_var;
END //

DELIMITER ;

SELECT GetShot(1);

