#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
   if [ $1 -ne 0 ] 
   then
       echo -e "instaling $2 is $R failed $N"
       exit 1
   else
       echo -e "installing $2 is $R success $N "
   fi  
}
   
if [ $ID -ne 0 ]
then
  echo " $R error: you are not a root user become root user $N"
  exit 1
else
  echo "you are a root user"   
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? MYSQL

yum install git -y &>> $LOGFILE

VALIDATE $? GIT