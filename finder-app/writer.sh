#!/bin/bash
# Assignment 1: writer.sh
# Author: Cherelei Banzon

writefile=$1
writestr=$2
dir=''
newdir=''

if [ $# -ne 2 ]
then
	echo "please specify 2 command line arguments"
	exit 1
fi

let a=0
let b=0
let slash=0

firstCharacter=${writefile:0:1}
#echo $firstCharacter

if [[ "$firstCharacter" =~ [^[:alnum:]]+ ]]
then
	echo "first character / is found"
	let slash=1
fi

IFS='/'
read -rasplitIFS<<< "$writefile"
for word in "${splitIFS[@]}"; do
   echo $word
	let a++
   echo a=$a

	if [ -z "$dir" ]
	then
		dir=$word
	else
		dir=$dir/$word
	fi
done

echo "a=$a"
echo "dir=$dir"

if [ $slash -eq 1 ]
then
	let c=a-2
else
	let c=a-1
fi

read -rasplitIFS<<< "$dir"
for word in "${splitIFS[@]}"; do
	echo "b=$b"
	if [ $b -eq 0 ]
	then
		echo "b==0"
		if [ $slash -eq 1 ]
		then
			newdir=/$word
		else
			newdir=$word
		fi
		echo "newdir=$newdir"
		if [ ! -d "$newdir" ] 
		then
			mkdir "$newdir"
		fi
	elif [ ! $b -eq $c ]
	then
	   echo "b!=c"
		newdir=$newdir/$word
		echo "newdir=$newdir"
		if [ ! -d "$newdir" ]
		then
			mkdir "$newdir"
		fi
	else
	   echo "b==c"
		newdir=$newdir/$word
		touch "$newdir"
	fi
	let b++
done

echo "$writestr" > "$newdir"
IFS=''
