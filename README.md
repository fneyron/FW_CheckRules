
# FW_CheckRules
For firewall migration from Checkpoint to Fortigate.

The script insert all the logs in a db then you have to create Rules and the script will check logs which match the rule.

First create tables with the command:
mysql -u root -D fw_logs < createTables.sql
Some examples are added 

Import you log in the database with the command : 
./import_db.sh < my_log_file
In my case logs are like below:
"7403998" "22Dec2014" "12:02:09" "Lan2.340" "192.168.250.69" "Log" "Accept" "40024" "64746" "192.168.34.89" "213.199.179.174" "udp" "80" "Accès Internet" "80-A1" "" "inzone: Internal; outzone: External" "Multi-product" "" ""

Adapt the script to use the right syntax (replace " " with "," for example)

Then add group/srv/rule with the following commands: 
./createGrp.sh
./createSrvc.sh
./createRule.sh

Once finish you can launch ./checkRules.sh

Cat /tmp/drop, /tmp/accept and /tmp/not_match :
Src Dst Service Rule_Matched
"192.168.24.182","192.168.31.225","13000","12"

root@debian:~# awk -F "," '{print $4}' /tmp/accept | sort | uniq -c
     12 "10"
    173 "11"
    329 "12"
    172 "13"
     12 "16"
     66 "17"
   6128 "18"
     15 "19"
      5 "7"
   2959 "8"
      3 "9"


