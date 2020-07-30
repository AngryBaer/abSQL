-- triggers collection

-- version up shot
DELIMITER //
CREATE TRIGGER Version_Up_Shot
AFTER INSERT ON shot_versions
FOR EACH ROW
	BEGIN
		
        -- update last updated field
        UPDATE shots SET shots.last_updated = NEW.date_created 
		WHERE shots.id = NEW.shot_id;
        
        -- update publish path if published
        IF NEW.published = true THEN
			UPDATE shots SET shots.published_path = NEW.published_path
            WHERE shots.id = NEW.shot_id;
        END IF;
        
        -- update preview path if updated
        IF NEW.preview_path = true THEN
			UPDATE shots SET shots.preview_path = NEW.preview_path
            WHERE shots.id = NEW.shot_id;
        END IF;
        
	END; //
DELIMITER ;

-- version up asset
DELIMITER //
CREATE TRIGGER Version_Up_Asset
AFTER INSERT ON asset_versions
FOR EACH ROW
	BEGIN
		
        -- update last updated field
        UPDATE assets SET assets.last_updated = NEW.date_created 
		WHERE assets.id = NEW.asset_id;
        
        -- update publish path if published
        IF NEW.published = true THEN
			UPDATE assets SET assets.published_path = NEW.published_path
            WHERE assets.id = NEW.shot_id;
        END IF;
        
        -- update preview path if updated
        IF NEW.preview_path = true THEN
			UPDATE assets SET assets.preview_path = NEW.preview_path
            WHERE assets.id = NEW.asset_id;
        END IF;
        
	END; //
DELIMITER ;

-- version up episode
DELIMITER //
CREATE TRIGGER Version_Up_Script
AFTER INSERT ON episode_versions
FOR EACH ROW
	BEGIN
		
        -- update last updated field
        UPDATE episodes SET episodes.last_updated = NEW.date_created 
        WHERE episodes.id = NEW.episode_id;
        
        -- update episode paths
        IF NEW.step_id = "" THEN
			UPDATE episodes SET episodes.script_path = NEW.version_path
			WHERE episodes.id = NEW.episode_id;
		ELSEIF NEW.step_id = "" THEN
			UPDATE episodes SET episodes.edit_path = NEW.version_path
			WHERE episodes.id = NEW.episode_id;
		ELSEIF NEW.step_id = "" THEN
			UPDATE episodes SET episodes.export_path = NEW.version_path
			WHERE episodes.id = NEW.episode_id;
        
        END IF;
		UPDATE episodes SET episodes.script_path = NEW.version_path
		WHERE episodes.id = NEW.episode_id;
        
	END; //
DELIMITER ;
