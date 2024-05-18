#!/bin/bash

DATE=$(date +%F) 
SCRIPT_NAME=$0
LOGFILE=/tmp/SCRIPT_NAME-$DATE.log
USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Installation $2.....FAILURE"
        exit 1
    else
        echo "Installation $2.....SUCCESS"
    fi
}

if [ $USERID  -ne 0 ]
then
    echo "ERROR : Run this script with root access"
    exit 1
#else
fi

yum install  -y &>> $LOGFILE 
VALIDATE $? "Installing mysql"

yum install postfix -y &>> $LOGFILE
VALIDATE $? "Installing postfix"