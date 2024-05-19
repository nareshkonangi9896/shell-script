#!/bin/bash
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
echo "$LOGFILE"
R="\e[31m"
G="\e[32m"
N="\e[0m"
USERID=$(id -u)
echo "USERID IS $USERID"
for i in $@
do
if [ $USERID -eq 0 ]
then
    yum install $i -y &>> $LOGFILE
    if [$? -eq 0 ]
        echo -e $i "Installation$G SUCCESS $N"
    else
        echo -e $i "Installation$R FAILURE $N"
        exit 1
    fi     
else
    echo "Run this script as ROOT user"
    exit 1       
fi
done