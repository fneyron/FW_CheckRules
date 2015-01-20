#/bin/bash

mysql -u root -D "fw_logs" --local-infile -e "LOAD DATA LOCAL INFILE '$1' IGNORE INTO TABLE test FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n';"

