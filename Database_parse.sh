#!/bin/sh
# this script will parse the database file and output the Database name 
# Database path and Autostart status

# this variable will store the file path
echo -n "Please enter the file path > "
read FILE_PATH

# We are filtering file data as column and used delimiter ":"
# to split line and saving results in intended variable
  
DATABASE_NAME=$(cat $FILE_PATH | awk '{print $1}' | cut -d : -f1)
DATABASE_PATH=$(cat $FILE_PATH | awk '{print $1}' | cut -d : -f2)
AUTOSTART=$(cat $FILE_PATH | awk '{print $1}' | cut -d : -f3)

#Displaying data fetched from parsed file
echo "Database Name : "
echo $DATABASE_NAME
echo ""
echo "Database Path : "
echo $DATABASE_PATH
echo ""
echo "Autostart Status : "
echo $AUTOSTART
