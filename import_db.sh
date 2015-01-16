#!/bin/sh

LOGS=$1

#dos2unix $LOGS

while read line 
do 
	mysql -u root -D fw_logs -e "INSERT INTO logs VALUES('$(echo $line | sed "s/;/','/g")');"
done < $LOGS
