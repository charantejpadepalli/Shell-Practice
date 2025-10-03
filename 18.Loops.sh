#!/bin/bash

USERID=$(id -u)
R="e\[31m"
G="e\[32m"
Y="e\[33m"
N="e\[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at:$(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root user"
    exit 1 #failure is other than 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installing $2 is $R failure $N" | tee -a $LOG_FILE
        exit 1 
    else
        echo -e "Installing $2 is $G success $N" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    #check package is installed or not
    dnf list installed $package &>>$LOG_FILE
    #if exit code is 0, already installed else not installed
    if [ $? -ne 0]; then
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package already installed... $Y SKIPPING $N"
    fi
done

#revisit session 17 for AWS CLI at 30 min
# aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro --security-group-ids sg- --tag-specifications 'ResourceType=instance,tags=[{Key=Name,Value=Test}]' --query 'Instance[0].PrivateIpAddress' --output text
#Add security group id for abovr query

