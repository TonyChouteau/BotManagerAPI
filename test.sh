#!/bin/bash


#=================================== test.sh ====================================#


#--------------------------------- Description ----------------------------------#
#
# This script tests the REST API and some commands you could use on it.
# It tests all the command written in request.txt
#
#--------------------------------------------------------------------------------#


#----------------------------------- Synopsis -----------------------------------#
#
# ./test.sh
#
#--------------------------------------------------------------------------------#


#----------------------------------- Options ------------------------------------#
#
# There isn't any option for this script
#
#--------------------------------------------------------------------------------#


#----------------------------------- Authors ------------------------------------#
#
# Sébastien HERT
#
#--------------------------------------------------------------------------------#


#------------------------------- Global Variables -------------------------------#

file="./request.txt"
lenTitle=80
nbLine=1

#--------------------------------------------------------------------------------#


#---------------------------------- Functions -----------------------------------#

title(){
	###
	# Description : Displays a Title in the terminal
	#
	# Input :
	# - The separator (=,-,*, etc)
	# - The title to display as a String
	#
	# Output :
	# - Display in a shell terminal
	#
	# Authors :
	# - Sébastien HERT
	###

	if [ $# -eq 0 ]; then
        param="Titre"
        id="="
    elif [ $# -eq 1 ]; then
        param=$1
        id="="
    elif [ $# -eq 2 ]; then
        param=$2
        id=$1
    else
        echo error
    fi

    lenParam=${#param}
    lenEq1=$(( ($lenTitle-$lenParam)/2 -1 ))
    lenEq2=$(( $lenTitle-$lenParam-$lenEq1-2 ))
    title=""
    for (( i = 0; i < $lenEq1; i++ )); do
        title="${title}$id"
    done
    title="${title} $param "
    for (( i = 0; i < $lenEq2; i++ )); do
        title="${title}$id"
    done

    echo -e "\e[35m\e[1m${title}\n\e[0m"
}

checkEndOfFile(){
	###
	# Description : Checks if a file finishes with an empty line
	#
	# Input :
	# - The file
	#
	# Output :
	# - None, but adding a new line if its necessary
	#
	# Authors :
	# - Sébastien HERT
	###
	
	end=$( tail -n 1 $file )
	if [[ $end != "" ]]; then
		echo "" >> $file
	fi
}


#--------------------------------------------------------------------------------#


#------------------------------------- Main -------------------------------------#

set -e

checkEndOfFile

title "=" "Testing REST API"


while read line
do
	if [[ "$line" != "" && "${line::1}" != "#" ]]; then
	
		command=$(echo $line | cut -d';' -f1 )
		expected=$(echo $(echo $line | cut -d';' -f2 ))

		title "-" "Testing Command Line $nbLine"

		echo -e "\e[34mCommand Tested :\e[0m $command\n"

		echo -e "\e[34mOutput expected :\e[0m $expected\n"

		echo -e "\e[34mOutput :\e[0m $($command)\n"

	fi
	(( nbLine++))
done < $file


title End

#--------------------------------------------------------------------------------#


#================================================================================#