#! /bin/bash

for ((i=1;i<5;i++));
do 
	su -c '~greeneca/ruby_installer.sh; exit' `cat /etc/group | grep sudo | sed 's/.*:.*:.*:\(.*\)/\1/' | sed 's/,/\ /g' | awk '{print $'$i'}';`
done
