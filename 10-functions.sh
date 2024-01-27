#!/bin/bash

ID=$(id -u)

VALIDATE(){
   if [ $1 -ne 0 ] 
   then
       echo "instaling $2 is failed"
       exit 1
   else
       echo "inatalling $2 is success "
   fi  
}
   
if [ $ID -ne 0 ]
then
  echo "error: you are not a root user become root user"
  exit 1
else
  echo " you are a root user"   
fi

yum install mysql -y

VALIDATE $? MYSQL