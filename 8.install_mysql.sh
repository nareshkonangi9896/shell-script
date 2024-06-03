#!/bin/bash

USERID=$(id -u)

if [ $USERID  -ne 0 ]
then
    echo "ERROR : Run this script with root access"
    exit 1
#else
fi

    yum install mysql -y
if [ $? -ne 0 ]
then
    echo "Installation of mysql is error"
else
    echo "Installation of mysql is success"    
fi