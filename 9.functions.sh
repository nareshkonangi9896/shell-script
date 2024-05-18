#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Installation.....FAILURE"
        exit 1
    else
        echo "Installation.....SUCCESS"
    fi
}

if [ $USERID  -ne 0 ]
then
    echo "ERROR : Run this script with root access"
    exit 1
#else
fi

yum install mysql -y
VALIDATE $? "Installing mysql"

yum install postfix -y
VALIDATE $? "Installing postfix"