#!/bin/bash

function chck_group(){
	if [ "$1" != "any" ]
	then 
		chck_grp=$(mysql -u root -D fw_logs --skip-column-names -e "select count(*) from fwGroup where grpName like '%$1';")
		if [ $((chck_grp)) -gt 0 ]
		then
			echo -e "Member of the group $1 : \n"
			mysql -u root -D fw_logs -e "select * from fwGroup where grpName like '%$1%';"
		fi
	fi
}

function chck_service(){
	chck_srvc=$(mysql -u root -D fw_logs --skip-column-names -e "select count(*) from fwService where srvcName like '%$1%';")
	if [ $((chck_srvc)) -gt 0 ]
	then
		echo -e "Service $1 contain : "
		mysql -u root -D fw_logs -e "select * from fwService where srvcName like '%$1%';"
	fi
}

clear
mysql -u root -D fw_logs -e "select distinct grpName from fwGroup;"
echo -e "Enter Source (group or any) : \n"
read source
chck_group $source

echo -e "Enter Destination (group or any) : \n"
read destination
chck_group $destination

mysql -u root -D fw_logs -e "select distinct srvcName from fwService;"
echo -e "Enter service group :"
read srvc_grp
chck_service $srvc_grp

echo "Enter policy (drop or accept default: accept):"
read policy
if [ "$policy" == "" ]; then policy="accept"; fi

echo "Enter rule number:"
read rule
if [ "$rule" == "" ]; then rule=$(($(mysql -u root -N -s -D fw_logs -e "select max(Rule) from fwRule;") + 1)); fi

mysql -u root -D fw_logs -e "insert into fwRule values('', '$source', '$destination', '$srvc_grp', '$policy', '$rule');"
mysql -u root -D fw_logs -e "select * from fwRule order by Rule;"
	

