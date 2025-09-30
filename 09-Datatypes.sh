#!/bin/bash

#everything in shell is considered as string
NUMBER1=100
NUMBER2=200
NAME=Devops

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "SUM is : $SUM" #we can use ${SUM} also

#size=3, Max index =2
LEADERS=("JAGAN" "YSR" "ME")

echo "All Leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADERS[0]}"
echo "First Leader: ${LEADERS[10]}"