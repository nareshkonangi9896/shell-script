#!/bin/bash
USERID=$(id -u)

if ($USERID -ne 0)
then
    echo "ERROR : Run this script with root access"
    exit 1
# else
#     yum install git -y
fi
