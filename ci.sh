#!/bin/bash
#

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
 if [ $? -eq 0 ]; then
       interface="$(/bin/ip route | awk '$1 == "default" {for (i=2;i<=NF;i++) if ($i == "dev") { i++;print $i; exit}}')"
       if /sbin/iw dev "$interface" info &>/dev/null; then 
            echo  "internet wireless connected"     

           
       else 

          echo "internet lan connected"

       fi

 else
   echo "no internet connection && check after 10min ... please wait"
   sleep 10m
   ( exec "ci.sh" )

 fi




