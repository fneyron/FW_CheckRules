#!/bin/bash

function default(){
	echo -e "$0 [-c|-e|-l]"
	echo -e "\t -c : Create a new group" 
	echo -e "\t -e : Erase a group"
	echo -e "\t -l : List groups"
}

if [ "$1" == "-c" ]
then
	mysql -u root -D fw_logs -e "select distinct grpName from fwGroup order by grpName;"
	ok="n"
	while [ "$ok" == "n" ]
	do	
		echo -e "Please enter group name : \n"
		read grpName
		chck_grp=$(mysql -u root -D fw_logs --skip-column-names -e "select count(*) from fwGroup where grpName like '%$grpName%';")
	        if [ $((chck_grp)) -gt 0 ]
       		then
			echo -e "Group already exist"
       	        	mysql -u root -D fw_logs -e "select * from fwGroup where grpName like '%$grpName%';"
        	fi

		add_range="y"
		nb_range=0
		ip=""
		while [ "$add_range" == "y" ]
		do	
			echo -e "Please enter network/mask or ip (ie: 192.168.0.0/24 or 192.168.0.1) and finish with ".": \n"
			read ip
			while [ "$ip" != "." ]
			do
				var=($(echo $ip | sed -n "s/\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)\/\([0-9]*\)/\1 \2/p"))
				if [ "${var[1]}" != "" ]
				then 
					ip_s=$(ipcalc $ip | grep HostMin | awk '{print $2}')
					ip_e=$(ipcalc $ip | grep HostMax | awk '{print $2}')
				else
					ip=($(echo $ip | sed -n "s/\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)/\1/p" | tr -d \"))
					ip_s=$ip	
					ip_e=$ip
				fi
				mysql -u root -D fw_logs -e "insert into fwGroup(id, grpName, ipRange, ip_start, ip_end) values('', '$grpName', '$ip', '$ip_s', '$ip_e');"
				read ip
			done
			echo -e "Add a new ip range for the group $grpName (y|n) : \n"
			read add_range
			mysql -u root -D fw_logs -e "select * from fwGroup where grpName like '%$grpName%';"
		done	
		echo -e "Are you agree with those changes (y|n) : \n"
		read ok
		if [ "$ok" == "n" ]
		then
			mysql -u root -D fw_logs -e "delete from fwGroup where grpName like '%$grpName%';"
		fi
	done
elif [ "$1" == "-e" ]
then
	mysql -u root -D fw_logs -e "select Distinct grpName from fwGroup;"
	echo -e "Enter the name of group to delete : \n"
	read grp_name
	mysql -u root -D fw_logs -e "delete from fwGroup where grpName='$grp_name';"
elif [ "$1" == "-l" ]
then 
	mysql -u root -D fw_logs -e "select distinct grpName from fwGroup order by grpName;"
	echo -e "Enter a group name to view : \n"
	read grpName
	chck_grp=$(mysql -u root -D fw_logs --skip-column-names -e "select count(*) from fwGroup where grpName like '%$grpName%';")
	if [ $((chck_grp)) -gt 0 ]
	then 
		mysql -u root -D fw_logs -e "select * from fwGroup where grpName like '%$grpName%';"
	fi
else 
	default 
	exit 0
fi



