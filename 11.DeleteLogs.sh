#!/bin/bash
APP_LOGS=/home/centos/app_logs
echo "$APP_LOGS"
SCRIPT_LOGS=/home/centos/script_logs
echo "$SCRIPT_LOGS"
SCRIPT_NAME=$0
DATE=$(date +%F:%H:%M:%S)
FILES_TO_DELETE=$(find APP_LOGS -name "*.log" -type f -mtime +14)

while read line;
do
    rm -rf $line
    echo "Deleted $line" &>> SCRIPT_LOGS/SCRIPT_NAME-DATE.log

done <<< FILES_TO_DELETE
