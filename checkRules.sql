DELIMITER $$
DROP PROCEDURE IF EXISTS checkRules;
CREATE PROCEDURE checkRules() 
BEGIN
	DECLARE r INTEGER DEFAULT 0;
	DECLARE src VARCHAR(255) DEFAULT "";
	DECLARE dst VARCHAR(255) DEFAULT "";
	DECLARE srvc VARCHAR(255) DEFAULT "";	
	DECLARE rule_done INTEGER DEFAULT 0;
	DECLARE pol VARCHAR(255) DEFAULT "accepted";
	DECLARE rule_cur CURSOR FOR 
		SELECT Rule, Source, Destination, Service, Policy FROM fwRule ORDER BY Rule; 
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET rule_done = 1;

	DROP TABLE IF EXISTS accepted;
	CREATE TABLE IF NOT EXISTS accepted(`Number` INT, `Rule` INT, PRIMARY KEY(Number));

	DROP TABLE IF EXISTS dropped;
	CREATE TABLE IF NOT EXISTS dropped (`Number` INT, `Rule` INT, PRIMARY KEY(Number));

	OPEN rule_cur; 
	get_rule: LOOP 
		FETCH rule_cur INTO r, src, dst, srvc, pol;
		-- SELECT rule, src, dst, srvc;
		IF rule_done THEN 
			LEAVE get_rule; 
		END IF;

		IF srvc = 'any' THEN
			BLOCK2: BEGIN
				DECLARE w TEXT DEFAULT "";
				DECLARE t TEXT DEFAULT "";
				SET t = 'logs l';
				IF src != 'any'
					THEN
					IF LEFT(src, 1) = '!'
					THEN
						SET w = CONCAT (w,' AND l.Source NOT IN (SELECT ip FROM ',SUBSTR(src, 2),')');
					ELSE
						SET t = CONCAT (t,', ',src,' s');
						SET w = CONCAT (w,' AND l.Source=s.ip');
					END IF;
				END IF;
				IF dst != 'any'
				THEN
					IF LEFT(dst, 1) = '!'
					THEN
						SET w = CONCAT (w,' AND l.Destination NOT IN (SELECT ip FROM ',SUBSTR(dst, 2),')');
					ELSE
						SET t = CONCAT (t,', ',dst,' d');
						SET w = CONCAT (w,' AND l.Destination=d.ip');
					END IF;
				END IF;
				-- SELECT w;
				IF pol = 'drop' THEN
					SET @cmd = CONCAT('INSERT IGNORE INTO dropped(Number, Rule) SELECT Number, ',r,' FROM ',t,' WHERE 1=1',w,' AND Number NOT IN (SELECT Number FROM accepted)');
				ELSE
					SET @cmd = CONCAT('INSERT IGNORE INTO accepted(Number, Rule) SELECT Number, ',r,' FROM ',t,' WHERE 1=1',w,'');
				END IF;
				SELECT @cmd;
				PREPARE stmt from @cmd;
				EXECUTE stmt;
			END BLOCK2;
		ELSE
			BLOCK2: BEGIN
				DECLARE srvc_done INTEGER DEFAULT 0;
				DECLARE proto VARCHAR(100);
				DECLARE w TEXT DEFAULT "";
				DECLARE t TEXT DEFAULT "";
				DECLARE p_b INT;
				DECLARE p_e INT;

				DECLARE srvc_cur CURSOR FOR 
					SELECT protocol, port_b, port_e FROM fwService WHERE srvcName = srvc; 
				DECLARE CONTINUE HANDLER FOR NOT FOUND SET srvc_done = 1;
				OPEN srvc_cur; 
				get_srvc: LOOP 
					FETCH srvc_cur INTO proto, p_b, p_e;
					IF srvc_done THEN 
						LEAVE get_srvc; 
					END IF;
					SET t = 'logs l';
					SET w = CONCAT('Service BETWEEN ',p_b,' AND ',p_e,' AND Protocol=\'',proto,'\'');
					IF src != 'any'
					THEN
						IF LEFT(src, 1) = '!'
						THEN
							SET w = CONCAT (w,' AND l.Source NOT IN (SELECT ip FROM ',SUBSTR(src, 2),')');
						ELSE
							SET t = CONCAT (t,', ',src,' s');
							SET w = CONCAT (w,' AND l.Source=s.ip');
						END IF;
					END IF;
					IF dst != 'any'
					THEN
						IF LEFT(dst, 1) = '!'
						THEN
							SET w = CONCAT (w,' AND l.Destination NOT IN (SELECT ip FROM ',SUBSTR(dst, 2),')');
						ELSE
							SET t = CONCAT (t,', ',dst,' d');
							SET w = CONCAT (w,' AND l.Destination=d.ip');
						END IF;
					END IF;
					-- SELECT w;
					IF pol = "drop" THEN
						SET @cmd = CONCAT('INSERT IGNORE INTO dropped(Number, Rule) SELECT Number, ',r,' FROM ',t,' WHERE ',w,' AND Number NOT IN (SELECT Number FROM accepted)');
					ELSE
						SET @cmd = CONCAT('INSERT IGNORE INTO accepted(Number, Rule) SELECT Number, ',r,' FROM ',t,' WHERE ',w,'');
					END IF;
					SELECT @cmd;
					PREPARE stmt from @cmd;
					EXECUTE stmt;
				END LOOP get_srvc;
				CLOSE srvc_cur;
			END BLOCK2;
		END IF;
	END LOOP get_rule;
	CLOSE rule_cur;
END$$
DELIMITER ;
CALL checkRules();
