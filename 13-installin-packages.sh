ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VAIDATE(){
    if [ $1 -ne 0 ]
    then
         echo -e "$2 is ..$R failed $N"
    else
         echo -e "$2 iS.. $G success $N"  
    fi  
}

echo "script started excuting $TIMESATMP"

if [ $ID -ne 0 ]
then
     echo -e "error : you are not a root user $R become root user $N"
     exit 1
else
     echo "you are a root user"
fi  

for package in $@
do
  yum list installed $package
  if [ $? -ne 0 ]
  then 
       yum install $package &>> $LOGFILE
       VALIDATE $? "installing $package"
  else
       echo -e "$package already installed ..$Y skipping $N"  
  fi  
done