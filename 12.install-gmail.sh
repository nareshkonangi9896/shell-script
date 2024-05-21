#!/bin/bash

LOGDIR=/tmp/
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -eq 0 ];
    then
        echo -e "$2 is$G SUCCESS $N"
    else
        echo -e "$2 is$R FAILURE $N"
        exit 1
    fi
}

ID=$(id -u)
if [ $ID -ne 0 ];
then
    echo -e "$R ERROR: Please run this script as ROOT user $N"
    exit 1
else
    echo "Please enter Username"
    read -s USERNAME
    echo "Username entered is $USERNAME"
    echo "Please enter Password"
    read -s PASSWORD
    echo "Password entered is $PASSWORD"


    yum update -y --exclude=kernel* &>> $LOGFILE
    VALIDATE $? "updating yum"

    yum -y install postfix cyrus-sasl-plain mailx &>> $LOGFILE
    VALIDATE $? "installed postfix,cyrus-sasl-plain,mailx"

    systemctl restart postfix
    VALIDATE $? "restarted postfix" &>> $LOGFILE

    systemctl enable postfix 
    VALIDATE $? "enabled postfix" &>> $LOGFILE

    cat gmailconf.txt >> /etc/postfix/main.cf
    VALIDATE $? "copied gmail conf" &>> $LOGFILE

    touch /etc/postfix/sasl_passwd  
    VALIDATE $? "creating sasl_passwd file" &>> $LOGFILE

    sed -i "[smtp.gmail.com]:587 $USERNAME:$PASSWORD" /etc/postfix/sasl_passwd
    VALIDATE $? "Entered username and password" &>> $LOGFILE

    postmap /etc/postfix/sasl_passwd
    VALIDATE $? "postmap gmail and password" &>> $LOGFILE 

    echo "This is a test mail & Date $(date)" | mail -s "message" nareshkonangi9896@gmail.com &>> $LOGFILE
     
fi
