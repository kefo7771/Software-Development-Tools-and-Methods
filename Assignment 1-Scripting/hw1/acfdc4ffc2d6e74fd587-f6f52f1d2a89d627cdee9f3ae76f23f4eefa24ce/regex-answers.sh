File=$1
#Ken Ford
if [ -z "$1" ]
then
	echo "Usage: regex-answer.sh filename"
	exit 1
fi
#Use regex commands to answer these questions

#How many lines end with number
egrep '[0-9]$' $1 | wc -l
#How many lines do not start with vowel
egrep '^[^aeiouAEIOU]' $1 | wc -l 
#How many 12 letter (alphabet only) lines
egrep '[a-zA-Z]{12}' $1 | wc -l
#How many phone numbers
egrep '[0-9]{3}\-[0-9]{3}\-[0-9]{4}' $1 | wc -l
#How many Boulder phone numbers
egrep '^303-[0-9]{3}\-[0-9]{4}' $1 | wc -l
#How many begin with vowel and end with number
egrep '^[aeiouAEIOU].*[0-9]$' $1 | wc -l
#How many email addresses are from geocities
egrep '[A-Za-z0-9\._-]+@geocities\.com' $1 | wc -l
#Incorrect email addresses
egrep '[A-Za-z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}' $1 | wc -l
