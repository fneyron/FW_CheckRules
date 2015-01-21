DELIMITER $$
DROP PROCEDURE IF EXISTS createRangeIP;
CREATE PROCEDURE createRangeIP() 
BEGIN
DECLARE grp VARCHAR(255) DEFAULT "";
DECLARE ip_s VARCHAR(255) DEFAULT "";
DECLARE ip_e VARCHAR(255) DEFAULT "";
DECLARE grp_done INTEGER DEFAULT 0;
DECLARE grp_cur CURSOR FOR 
SELECT grpName, ip_start, ip_end FROM fwGroup; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET grp_done = 1;

OPEN grp_cur; 
get_grp: LOOP 
	FETCH grp_cur INTO grp, ip_s, ip_e;
	IF grp_done THEN 
		LEAVE get_grp; 
	END IF;
	-- Create dynamic group table from fwGrp table 
	SET @cmd = CONCAT('CREATE TABLE IF NOT EXISTS`',grp,'`(ip VARCHAR(255) PRIMARY KEY);');
	-- SELECT grp, ip_s, ip_e;
	PREPARE stmt from @cmd;
	EXECUTE stmt;
	-- Select IP range for this group
	-- SELECT Source FROM (SELECT DISTINCT Source FROM logs UNION SELECT DISTINCT Destination FROM logs) AS U WHERE INET_ATON(U.Source) BETWEEN INET_ATON(ip_s) AND INET_ATON(ip_e);
	BLOCK2: BEGIN
		DECLARE ip VARCHAR(255) DEFAULT "";
		DECLARE ip_done INTEGER DEFAULT 0;
		DECLARE ip_cur CURSOR FOR 
			SELECT Source FROM (SELECT DISTINCT Source FROM logs UNION SELECT DISTINCT Destination FROM logs) AS U WHERE INET_ATON(U.Source) BETWEEN INET_ATON(ip_s) AND INET_ATON(ip_e);
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET ip_done = 1;
		OPEN ip_cur; 
		get_ip: LOOP 
			FETCH ip_cur INTO ip;
			IF ip_done THEN 
				LEAVE get_ip; 
			END IF;
			SET @cmd = CONCAT('INSERT IGNORE INTO `',grp,'` VALUES(\'',ip,'\');');
			-- SELECT ip_s, ip_e, ip, @cmd;
			PREPARE stmt from @cmd;
			EXECUTE stmt;
		END LOOP get_ip;
		CLOSE ip_cur;
	END BLOCK2;
	-- End insert loop
END LOOP get_grp;
CLOSE grp_cur;
-- End create group loop
END$$
DELIMITER ;
CALL createRangeIP();
