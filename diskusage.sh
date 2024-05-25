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
DISKUAGE=$(df -hT|grep -vE 'tmpfs|Filesystem'|awk -F " " '{print $6F}'|cut -d % -f 1)
DISKNAME=$(df -hT|grep -vE 'tmpfs|Filesystem'|awk -F " " '{print $1F}')
message=
THRESHOLD=1
if [ $USERID -eq 0 ]
then
    while IFS= read line
    do
        if [ $DISKUAGE -gt $THRESHOLD ]
        then
            $message+= "HIGH DISK USAGE ON $DISKNAME : $DISKUSAGE"
        fi
    done <<<$DISKUAGE
else
    echo "Run this script as ROOT user"
    exit 1       
fi

echo "$message"



