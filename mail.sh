#!/bin/bash

$TOADDRESS=$1
$SUBJECT=$2
$BODY=$3
$TEAMNAME=$4
$ALERT_TYPE=$5

#echo $BODY | mail -s $SUBJECT $TOADDRESS 

FINAL_BODY=$(sed -e "s/TEAMNAME/$TEAMNAME/g" -e "s/ALERTYPE/$ALERT_TYPE/g" -e "s/Message/$BODY/g" gmail.html)

echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TOADDRESS"