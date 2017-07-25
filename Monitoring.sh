#!/bin/bash
#file change script - This script will check the file change event

# PATH_OF_FOLDER variable stores which folder is on "Monitoring". Set Variable 
# for intended directory to be checked ex: /var/log, do not put "/" at the end 
# of directory name 

PATH_OF_FOLDER="Give the Path of folder for Monitoring"

# PATH_OF_LOGFILE variable stores the path of Logfile. Set Variable 
# to save log file in any directory ex: /var/log, do not put "/" at the end 
# of directory name

PATH_OF_LOGFILE="Give path to store Logs"

#This Variable list if "logfile_old" already exist or not

FILENAME=`ls $PATH_OF_LOGFILE | grep logfile_old`

#Checks if "Logfile_old" exist or not, if It exists then it will not create
#another "Logfile_old"

if [ "$FILENAME" = "logfile_old" ]
then

# This variable stores the status of all the files in specified directory
# and log the output in "logfile"
	
	CHECK_FILE_STATUS=`stat --format "%y%n" $PATH_OF_FOLDER/* > $PATH_OF_LOGFILE/logfile`

# This variable will store the comparision output of two files.
# It will only log those Files which are modified from last check
 
	COMPARE_FILE_OUTPUT=`comm -23 <(sort $PATH_OF_LOGFILE/logfile) <(sort $PATH_OF_LOGFILE/logfile_old) > $PATH_OF_LOGFILE/output_logfile`	
#this Loop will only execute once to create the logfile

else

# This variable stores the status of all the files in specified directory
# and log the output in "logfile"

	CHECK_FILE_STATUS=`stat --format "%y%n" $PATH_OF_FOLDER/* > $PATH_OF_LOGFILE/logfile`

# This will rename the file to "logfile_old" 

	`mv $PATH_OF_LOGFILE/logfile $PATH_OF_LOGFILE/logfile_old`
fi

