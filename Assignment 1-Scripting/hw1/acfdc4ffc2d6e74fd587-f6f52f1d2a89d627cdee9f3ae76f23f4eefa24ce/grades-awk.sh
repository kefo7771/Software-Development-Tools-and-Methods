#!/bin/bash
#Ken Ford

file=$1
if [ -z "$1" ]
then 
	echo "Usage: grades-awk.sh filename"
	exit 1
fi

awk 'BEGIN {FS=OFS=" ";} {avg=0;avg+=($4+$5+$6)/3;print int(avg) " ["$1"] " $3","$2}' ${file} | sort -t" " --key=3d --key=4d --key=2g
