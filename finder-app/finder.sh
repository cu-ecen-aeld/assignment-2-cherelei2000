#!/bin/bash
# Assignment 1: finder.sh
# Author: Cherelei Banzon

filesdir=$1
searchstr=$2

if [ $# -ne 2 ]
then
	echo "please specify 2 command line arguments"
	exit 1
fi

if [ ! -d $filesdir ]
then
#	echo "${filesdir} is a directory"
#else
	echo "${filesdir} is not a directory"
	exit 1
fi

#number_of_files=$(find ${filesdir} -type f | wc -l)
#number_of_match=$(find -type f -name "*${searchstr}*" | wc -l)
#number_of_match=$(grep ${searchstr} -r ${filesdir}/ | wc -l)

let number_of_files=0
let number_of_match=0

files=$( du -a $1 | awk '{ print $2 }')

for file in $files:
do
	#if [ -d "$file" ]
	#then
	#	echo "$file is a directory"
	#elif [ -s "$file" ]
	if [ -s "$file" ] && [ ! -d "$file" ]
	then
		#echo "$file is a file and is not empty"
		let number_of_files++
		num=$( grep -c $2 $file)
		let "number_of_match=number_of_match+$num"
	#elif [ -e "$file" ]
	#then
	#	echo "$file is a file and is empty"
	#	let a++
	#else
	#	echo "$file is not a file"
   fi	
done

echo "The number of files are ${number_of_files} and the number of matching lines are ${number_of_match}"

