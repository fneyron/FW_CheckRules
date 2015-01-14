#!/bin/sh

LOGS=$1

dos2unix $LOGS

while read line 
do 
	r=$(echo $line | sed "s/\" \"/','/g" | sed "s/\"/'/g")
	echo "INSERT INTO logs VALUES(${r});"
	mysql -u root -D fw_logs -e "INSERT INTO logs VALUES(${r});"
done < $LOGS
