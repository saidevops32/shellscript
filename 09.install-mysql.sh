#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
  echo "error: you are not a root user become root user"
  exit 1
else
  echo " you are a root user"   
fi

yum install mysql -y

if [ $? -ne 0 ] 
then
  echo "instaling mysql is failed"
  exit 1
else
  echo "inatalling mysql is success "
fi  