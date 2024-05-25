#!/bin/bash

$TOADDRESS=$1
$SUBJECT=$2
$BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
$TEAMNAME=$4
$ALERT_TYPE=$5

#echo $BODY | mail -s $SUBJECT $TOADDRESS 

#FINAL_BODY=$(sed -e "s/TEAMNAME/$TEAMNAME/g" -e "s/ALERTYPE/$ALERT_TYPE/g" -e "s/Message/$BODY/g" gmail.html)

#echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TOADDRESS"

echo "all args : $@"

#FINAL_BODY=$(sed -e "s/TEAMNAME/$TEAMNAME/g" -e "s/ALERTYPE/$ALERT_TYPE/g" -e "s/Message/$BODY/g" gmail.html)

#echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TOADDRESS"

FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAMNAME/g" -e "s/ALERTYPE/$ALERT_TYPE/g" -e "s/Message/$BODY/g" gmail.html)

echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TOADDRESS"

