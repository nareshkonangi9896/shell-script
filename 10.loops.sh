#!/bin/bash
DATE=$(date)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
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
    echo -e $i "Installation $G SUCCESS $N"
else
    echo -e $i "Installation $R FAILURE $N"
    exit 1       
fi
done