#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILEDIR=/tmp
LOGFILE=$LOGFILEDIR/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
DISKUAGE=$(df -hT|grep -vE 'tmpfs|Filesystem') #|awk -F " " '{print $6F}'|cut -d % -f 1)
THRESHOLD=1
if [ $USERID -eq 0 ]
then
    while IFS  read line
    do
        echo "usage : $DISKUSAGE"

    done
else
    echo "Run this script as ROOT user"
    exit 1       
fi



