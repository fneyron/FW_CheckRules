DELIMITER $$
DROP PROCEDURE IF EXISTS deleteRangeIP;
CREATE PROCEDURE deleteRangeIP()
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
	SET @cmd = CONCAT('DROP TABLE IF EXISTS `',grp,'`');
        PREPARE stmt from @cmd;
        EXECUTE stmt;
END LOOP get_grp;
CLOSE grp_cur;
-- End create group loop
END$$
DELIMITER ;
CALL deleteRangeIP();

