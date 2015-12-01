#!/usr/bin/env sh

user=""
pass=""
path="./data"
#Check to see if at least one argument was specified
if [ $# -lt 4 ] ; then
   echo "You must specify at least 2 arguments ( -u, -p)."
   echo "-u cloud control admin username"
   echo "-p cloud control admin password"
   echo "-t target absolute file path to place generated csv. Ensure folder exists. Default: ./data"
   echo "example:  ./execute.sh -u username -p 'password' -t '/usr/mydir/data'"
   exit 1
fi
 
#Process the arguments
while getopts u:p:t:h opt
do
   case "$opt" in
      u) user=$OPTARG;;
      p) pass=$OPTARG;;
      t) path=$OPTARG;;
      h) usage;;
      \?) usage;;
   esac
done

/usr/local/bin/node /Users/andrewdas/Documents/GitHub/ccresource/mcpEnvToCSV.js $user $pass $path 
