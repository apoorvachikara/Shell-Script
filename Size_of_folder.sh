#/bin/sh
#This script will find the size of 
# /u01/BACKUP folder
SIZE=`du -sh  -t 1G /u01/BACKUP`
echo "$SIZE"
