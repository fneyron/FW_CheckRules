#!/bin/bash

while read line 
do
	src=$(echo $line | awk -F, '{print $1}')
	dst=$(echo $line | awk -F, '{print $2}')
	host_s=$(dig +tries=1 +time=2 +noall +answer -x $src | awk '{print $5}')
	host_d=$(dig +tries=1 +time=2 +noall +answer -x $dst | awk '{print $5}')
	echo $line | sed -e "s/$/,$host_s,$host_d/" >> resolved_dropped_host.txt
done < drop.txt
