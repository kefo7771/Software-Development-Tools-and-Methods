#!/bin/bash
#Ken Ford
if [ -z "$1" ]
then
	echo "Usage grades.sh filename"
fi
File=$1 
while read -r f1 f2 f3 f4 f5 f6
do
	#echo "Id Number is:" $f1
	#echo "First Name is:" $f2
	#echo "Last Name is:" $f3
	#echo "Grade 1 is:" $f4
	#echo "Grade 2 is:" $f5
	#echo "Grade 3 is:" $f6
	sum=$(( $f4 + $f5 +$f6))
	#echo $sum
	avg=$(( $sum / 3))
	#echo $avg
	
	echo "$avg [$f1] $f3,$f2" 
done < "$File" | sort -k 3
