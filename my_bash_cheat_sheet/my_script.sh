#!/bin/bash

#Simple command
echo "Hello Gregory"

#USER INPUT
read -p "What is your second name?" SECOND_NAME
echo "Their second name is $SECOND_NAME"

#VARIABLES
# Should be uppercase by convention
NAME="Mwangi"

#REFERENCING A VARIABLE
echo "Hello there $NAME"

#CONDITIONALS
#1. SIMPLE IF STATEMENT
if [ "$NAME" == "Mwangi" ]
then
	echo "Your name is Mwangi"
fi
#2. IF-ELSE STATEMENT
if [ "$NAME" == "Greg" ]
then
	echo "Your name is Greg"
else
	echo "Your name is not Greg"
fi
#3. IF-ELIF-ELSE
if [ "$NAME" == "Greg" ]
then
        echo "Your name is Greg"
elif [ "$NAME" == "Waburi" ]
then
	echo "Your name is Waburi"
else
        echo "Your name is not Greg or  Waburi"
fi

#COMPARISON
# -eq -ne -gt -lt -ge -le
NUM1=3
NUM2=5
if [ "$NUM1" -gt "$NUM2" ]
then
	echo "$NUM1 is greater than $NUM2"
else
	echo "$NUM1 is less than $NUM2"
fi

#FILE CONDITIONS
# -e(exists) -f(regular file) -d(directory) -s(not size zero) etc
FILE="text.txt"
if [ -f "$FILE" ]
then
	echo "$FILE is a regular file"
else
	echo "$FILE is not a regular FILE"
fi

#CASE STATEMENTS
read -p "Are you over 21? Y/N : " ANSWER
case "$ANSWER" in
	[yY] | [yY][eE][sS])
		echo "You can have a beer :)"
		;;
	[nN] | [nN][oO])
		echo "Sorry, no drinking"
		;;
	*)
		echo "Please enter y|yes or n|no"
		;;
esac

#FOR LOOP
NAMES="Greg Mwangi Waburi Grace Ciku Alba"
for NAME in $NAMES
	do
		echo "Hello there $NAME"
done

#FOR LOOP to rename files
FILES=$(ls *.txt)
NEW="new_"

for FILE in $FILES
	do
		echo "Renaming $FILE to $NEW$FILE"
		mv $FILE $NEW$FILE
done

#WHILE loop to read a file line by line
# LINE=1
while read -r CURRENT_LINE
    do
        echo "$LINE: $CURRENT_LINE"
        ((LINE++))
done < "new_1.txt"

#functions
function say_hello(){
    echo "Hello Gregory"
}

say_hello

#function with parameters
#Here we don't put the parameters within parentheses like in other languages.
#Rather, we use what are called positional parameters
#And just like the name suggests, parameters are assigned according to their
#positions
function greet(){
    echo "My name is $1 and I am $2"
}

greet "Greg" "21"

#so if change the positions of how you pass them, output will change
greet "21" "Greg"

#you can also put commands that you would have otherwise put in the terminal
mkdir hello
touch hello/hello.txt
echo "Hello World" >> hello/hello.txt
echo "Created file hello"