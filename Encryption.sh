#!/bin/sh
#This script will allow user to create RSA and DSA key-pair, Encryption using gpg RSA-key-pair
#decryption using gpg RSA-key-pair. You need to import sender key first to decrypt the file. 
#check with --list-keys.

# Displaying Options for Creation key-pair, Encryption and Decryption 
echo  " [1] Would you like to create your gpg keys?"
echo  " [2] Would you like to encrypt any files?"
echo  " [3] Would you like to decrypt any files?"
echo -n "       Please enter 1, 2 or 3 : "

# this variable stores user preferred  option
read USER_DECISION

# Starting of Case loop
case $USER_DECISION in 

# It will create the keys as per user input
	1) `gpg --gen-key`;;

# It will encrypt the files with user private key. File should be in same directory to encrypt it 
	2) echo " Note: Run script in same directory where you have file to encrypt "

# Reading user input file name
	   echo -n "Please enter the file name to encrypt > "
		read FILE_NAME

# Reading recipient email address 
		echo -n "Please Enter recipient email > "
		read RECIPIENT_NAME

# Encrypting File with private key
		`gpg -e -r $RECIPIENT_NAME $FILE_NAME`;;

# It will decrypt the files with sender public key. File should be in same directory and sender public key should be
# imported. check gpg --help 	
# Rading User Input for file name
	3) echo " Please fetch the sender public key to decrypt file "
	   echo " Note: Run script in same directory where you have gpg file to decrypt "
	   echo -n "Please enter the file name to decrypt with gpg extension > "
		read DECRYPT_FILE

# Reading the required name of the output file from user
	   echo -n "Please enter file name for decrypted output file > "
		read OUTPUT_FILE

# Decrypting the file with sender public key
		`gpg -o $OUTPUT_FILE -d $DECRYPT_FILE`;;

esac
