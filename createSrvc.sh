#!/bin/bash

function default(){
	echo -e "$0 [-c|-e|-l]"
	echo -e "\t -c : Create a new service group" 
	echo -e "\t -e : Erase a service group"
	echo -e "\t -l : List service groups"
}

if [ "$1" == "-c" ]
then
	mysql -u root -D fw_logs -e "select distinct srvcName from fwService;"
	ok="n"
	while [ "$ok" == "n" ]
	do	
		echo -e "Please enter service group name : \n"
		read srvcName
		echo "Enter protocol(tcp|udp|icmp) follower by port. IE: UDP53 or TCP130-135. Finish by \".\""
		read srvc	
		while [ "$srvc" != "." ]
		do
			var=$(echo $srvc | tr -d \" | tr -d \  | sed -n "s/\([a-zA-Z]*\)\([0-9]*\)[-]\{0,1\}\([0-9]*\).*/\1 \2 \3/p")
			protocol=$(echo $var | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
			port_b=$(echo $var | awk '{print $2}')
			port_e=$(echo $var | awk '{print $3}')		
			if [ "$port_e" == "" ]
			then
				port_e=$port_b

			fi
			if [ "$srvc" != "" ]
			then
				mysql -u root -D fw_logs -e "insert into fwService(id, srvcName, protocol, port_b, port_e) values('', '$srvcName', '$protocol', '$port_b', '$port_e');"
			fi	
			read srvc
		done	
		mysql -u root -D fw_logs -e "select * from fwService where srvcName like '%$srvcName%';"
		echo -e "Are you agree with those changes (y|n) : \n"
		read ok
		if [ "$ok" == "n" ]
		then
			mysql -u root -D fw_logs -e "delete from fwService where srvcName like '%$srvcName%';"
		fi
	done
elif [ "$1" == "-e" ]
then
	mysql -u root -D fw_logs -e "select distinct srvcName from fwService order by srvcName;"
	echo -e "Enter the name of service group to delete : \n"
	read srvc_name 
	mysql -u root -D fw_logs -e "delete from fwService where srvcName like '$srvc_name';"
elif [ "$1" == "-l" ]
then 
	mysql -u root -D fw_logs -e "select distinct srvcName from fwService order by srvcName;"
	echo -e "Enter a service group name to view : \n"
	read srvcName
	chck_srvc=$(mysql -u root -D fw_logs --skip-column-names -e "select count(*) from fwService where srvcName like '%$srvcName%';")
	if [ $((chck_srvc)) -gt 0 ]
	then 
		mysql -u root -D fw_logs -e "select * from fwService where srvcName like '%$srvcName%';"
	fi
else 
	default 
	exit 0
fi



