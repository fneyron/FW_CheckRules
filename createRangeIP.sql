DELIMITER $$
DROP PROCEDURE IF EXISTS createRangeIPTest;
CREATE PROCEDURE createRangeIPTest() 
BEGIN
DECLARE grp VARCHAR(255) DEFAULT "";
DECLARE ip_s VARCHAR(255) DEFAULT "";
DECLARE ip_e VARCHAR(255) DEFAULT "";
DECLARE grp_done INTEGER DEFAULT 0;
DECLARE grp_cur CURSOR FOR 
	SELECT grpName, ip_start, ip_end FROM fwGroup; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET grp_done = 1;

DROP TEMPORARY TABLE IF EXISTS ip_tmp;
SELECT "Creating temporary table with all ip from logs";
CREATE TEMPORARY TABLE IF NOT EXISTS ip_tmp AS SELECT DISTINCT Source FROM logs UNION SELECT DISTINCT Destination FROM logs;

OPEN grp_cur; 
get_grp: LOOP 
	FETCH grp_cur INTO grp, ip_s, ip_e;
	IF grp_done THEN 
		LEAVE get_grp; 
	END IF;
	-- Create dynamic group table from fwGrp table 
	SET @cmd = CONCAT('CREATE TABLE IF NOT EXISTS `',grp,'` (ip VARCHAR(255) PRIMARY KEY);');
	PREPARE stmt from @cmd;
        EXECUTE stmt;
	-- Select IP range for this group
	SELECT CONCAT("Selecting IP for group : ", grp);
	IF ip_s <> ip_e THEN
		SET @cmd = CONCAT('INSERT IGNORE INTO `',grp,'` SELECT Source FROM ip_tmp WHERE INET_ATON(Source) BETWEEN INET_ATON(\'',ip_s,'\') AND INET_ATON(\'',ip_e,'\');');
		-- SELECT @cmd;
	ELSE
		SET @cmd = CONCAT('INSERT IGNORE INTO `',grp,'` VALUES (\'',ip_s,'\');');
		-- SELECT @cmd;
	END IF;
        PREPARE stmt from @cmd;
        EXECUTE stmt;
END LOOP get_grp;
CLOSE grp_cur;
-- End create group loop
END$$
DELIMITER ;
CALL createRangeIPTest();
