#!/bin/bash

DATE=$(date +%F) 
SCRIPT_NAME=$0
LOGFILE=/tmp/SCRIPT_NAME-$DATE.log
USERID=$(id -u)

R=\e[31m
G=\e[32m
N=\e[0m

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e " $2.....$R FAILURE"
        exit 1
    else
        echo -e " $2.....$G SUCCESS"
    fi
}

if [ $USERID  -ne 0 ]
then
    echo "ERROR : Run this script with root access"
    exit 1
#else
fi

yum install mysql -y &>> $LOGFILE 
VALIDATE $? "Installing mysql"

yum install postfix -y &>> $LOGFILE
VALIDATE $? "Installing postfix"