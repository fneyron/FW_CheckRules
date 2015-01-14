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
		add_srvc="y"
		nb_srvc=0
		while [ "$add_srvc" == "y" ]
		do	
			echo -e "Please enter protocol (tcp|udp|icmp) : \n"
			read protocol
			echo -e "Please enter port begin : \n"
			read port_b
			echo -e "Please enter port end : \n"
			read port_e
			echo -e "Add a new service for the group $srvcName (y|n) : \n"
			read add_srvc
			mysql -u root -D fw_logs -e "insert into fwService(id, srvcName, protocol, port_b, port_e) values('', '$srvcName', '$protocol', '$port_b', '$port_e');"
			mysql -u root -D fw_logs -e "select * from fwService where srvcName like '%$srvcName%';"
		done	
		echo -e "Are you agree with those changes (y|n) : \n"
		read ok
		if [ "$ok" == "n" ]
		then
			mysql -u root -D fw_logs -e "delete from fwService where srvcName like '%$srvcName%';"
		fi
	done
elif [ "$1" == "-e" ]
then
	mysql -u root -D fw_logs -e "select distinct srvcName from fwService;"
	echo -e "Enter the name of service group to delete : \n"
	read srvc_name 
	mysql -u root -D fw_logs -e "delete from fwService where name='$srv_name';"
elif [ "$1" == "-l" ]
then 
	mysql -u root -D fw_logs -e "select distinct srvcName from fwService;"
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



