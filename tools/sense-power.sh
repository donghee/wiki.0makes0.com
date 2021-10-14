#!/bin/sh

while true; do 
 SENSORS=(`python ~/ina226.py`)

 CURRENT=${SENSORS[0]}  
 VOLTAGE=${SENSORS[1]}  
 POWER=${SENSORS[2]}  
 BATTERY=${SENSORS[3]}  

 WEATHERS=(`python ~/weather.py`)
 TEMPERATURE=${WEATHERS[0]}  
 FORECAST=${WEATHERS[1]}  
 LATITUDE=${WEATHERS[2]}  
 LONGITUDE=${WEATHERS[3]}  

 #VOLTAGE=`seq 13 0.1 14 | shuf | head -n1`;
 #BATTERY=`seq 70 1 90 | shuf | head -n1`;
 #POWER=`seq 1 .1 1.5 | shuf | head -n1`;

 echo -e "{\"voltage\": $VOLTAGE, \"battery\": $BATTERY, \"powerConsumption\": $POWER, \"current\": $CURRENT, \"forecast\": \"$FORECAST\", \"temperature\": $TEMPERATURE, \"date\": \"$(date)\", \"uptime\": \"$(uptime -p)\", \"latitude\": $LATITUDE, \"longitude\": $LONGITUDE }" > /tmp/index.html; sleep 1; done
