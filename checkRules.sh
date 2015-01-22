#/bin/bash
drop="/tmp/drop"
accept="/tmp/accept"
not_match="/tmp/not_match"

if [ -f $drop ]
then 
	rm $drop
fi
if [ -f $accept ]
then 
	rm $accept
fi
if [ -f $not_match ]
then 
	rm $not_match
fi

#echo "Creating Range"
#mysql -u root -D fw_logs < createRangeIP.sql 
echo "Creating Tables"
mysql -u root -D fw_logs < checkRules.sql
mysql -u root -D fw_logs -e "SELECT Source, Destination, Service, d.Rule INTO OUTFILE '$drop' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' FROM logs l, dropped d WHERE d.Number=l.Number;"
mysql -u root -D fw_logs -e "SELECT Source, Destination, Service, a.Rule INTO OUTFILE '$accept' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' FROM logs l, accepted a WHERE l.Number=a.Number;"
mysql -u root -D fw_logs -e "SELECT Source, Destination, Service INTO OUTFILE '$not_match' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' FROM logs l WHERE l.Number NOT IN (SELECT Number FROM accepted) AND l.Number NOT IN (SELECT Number FROM dropped);"

