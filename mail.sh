#!/bin/bash

#anyone in your project can call this script with arguments
# mail.sh TO_ADDRESS SUBJECT BODY TEAM_NAME ALERT_TYPE

TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
echo "escaped content: $BODY"
TEAMNAME=$4
ALERTYPE=$5

#echo "all args: $@"

FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAMNAME/g" -e "s/ALERT_TYPE/$ALERTYPE/g" -e "s/MESSAGE/$BODY/g" gmail.html)

echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"