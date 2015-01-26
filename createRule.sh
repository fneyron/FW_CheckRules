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
		mysql -u root -D fw_logs -e "select * from fwService where srvcName='$1';"
	fi
}


function default(){
        echo -e "$0 [-c|-e|-l]"
        echo -e "\t -c : Create a new group"
        echo -e "\t -e : Erase a group"
        echo -e "\t -l : List groups"
}

if [ "$1" == "-c" ]
then
clear
mysql -u root -D fw_logs -e "select distinct grpName from fwGroup;"
echo -e "Enter Source (group, ip or any) and finish ".": \n"
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
mysql -u root -D fw_logs -e "select Rule, Source, Destination, Service, Policy from fwRule order by Rule;"
	
elif [ "$1" == "-l" ]
then
	mysql -u root -D fw_logs -e "select Rule, Source, Destination, Service, Policy, Active from fwRule order by Rule;"
	echo "Give a rule number: "
	read rule
	echo "Group Source:"
	mysql -u root -D fw_logs -e "select grpName, ipRange, ip_start, ip_end from fwGroup g, fwRule f where g.grpName=f.Source and f.Rule=$rule;" 
	echo "Group Destination:"
	mysql -u root -D fw_logs -e "select grpName, ipRange, ip_start, ip_end from fwGroup g, fwRule f where g.grpName=f.Destination and f.Rule=$rule;"
	echo "Service Group:"
	mysql -u root -D fw_logs -e "select srvcName, protocol, port_b, port_e from fwService s, fwRule f where s.srvcName=f.Service and f.Rule=$rule;"
else 
	default
fi

