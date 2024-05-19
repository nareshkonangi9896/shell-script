#!/bin/bash
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
echo "$LOGFILE"
R="\e[31m"
G="\e[32m"
N="\e[0m"
USERID=$(id -u)

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e $i "Installation$G SUCCESS $N"
    else
        echo -e $i "Installation$R FAILURE $N"
        exit 1
    fi
}

EXIST_VALIDATE(){
    yum list installed|grep $1 &>> $LOGFILE  
    if [ $? -eq 0 ]
    then
        echo -e $i "Not Installed previously$G PROCEED TO INSTALL $N"
    else
        echo -e $i "Already Installed$R ABORT THE INSTALLATION $N"
        exit 1
    fi
}

for i in $@
do
if [ $USERID -eq 0 ]
then
    EXIST_VALIDATE $i
    yum install $i -y &>> $LOGFILE  
    VALIDATE $?
else
    echo "Run this script as ROOT user"
    exit 1       
fi
done