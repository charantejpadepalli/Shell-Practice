#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "Given Number $NUMBER is less than 10"
elif [ $NUMBER -eq 10 ]; then
    echo " Given Number  $NUMBER is equal to 10"
else
    echo "GIven Number $NUMBER is greater than 10"
fi

# greater than = -gt
# less than = -lt
# equal to = -eq
# not equal to = -ne 