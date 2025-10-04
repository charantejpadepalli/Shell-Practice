#!/bin/bash

count=5

echo "starting countdown"

while[ $count -gt 0 ]
do  
    echo "Time left: $count"
    sleap 1
    count=$((count - 1))
done

echo "Times up!"