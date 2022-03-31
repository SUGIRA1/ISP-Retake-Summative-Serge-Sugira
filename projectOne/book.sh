#!/bin/bash

# add a new contact function - no parameters
# asking for : first name, last name, phone number, email address
newContact()
{
	echo
	while true
	do
		echo "Adding a new contact. Please enter the following information in the format:"
		echo "format: \"Last name,first name,email,phone number\" (no quotes or spaces)."
		echo "Example: isp,psi,psi@gmail.com,988560034"
		echo "Enter data or q to quit"
		read aInput
		if [ "$aInput" == 'q' ]
			then
			break
		fi
		echo
        # save information as a contact
		echo $aInput >> addressbook.csv
		echo "New contact added successfully!"
		echo
	done
}

# display all contacts function - no parameters
displayAll()
{
	echo
	echo "Displaying all contacts."
	echo
	# display all contacts
	cat addressbook.csv
	echo
}


# search and display contacts function - no parameters
# asking for : last name
searchContact()
{
	echo
	while true
	do
		echo "Enter the last name of the person."
		echo "Enter data or q to quit"
		read dInput
		if [ "$dInput" == 'q' ]
			then
			break
		fi
		echo
		echo "Contacts for \"$dInput\":"
		grep ^"$dInput" addressbook.csv
		RETURNSTATUS=`echo $?`
		if [ $RETURNSTATUS -eq 1 ]
			then
			echo "No contacts found with last name of \"$dInput\"."
		fi
		echo
	done
}

# search for a record and edit it - no parameters
# search using either email or last name
editContact()
{
	echo
	while true
	do
		echo "Enter any search term, e.g. last name or email address."
		echo "Enter data or q to quit"
		read eInput
		if [ "$eInput" == 'q' ]
			then
			break
		fi
		echo
		echo "Listing contacts for \"$eInput\":"
        # searching for a record
		grep -n "$eInput" addressbook.csv
		RETURNSTATUS=`echo $?`
        # did not find anything
		if [ $RETURNSTATUS -eq 1 ]
			then
			echo "No contacts found for \"$eInput\""
        # found some records
		else
			echo
			echo "Enter the line number that you'd like to edit."
			read lineNumber
			echo
            # loop and display the results
			for line in `grep -n "$eInput" addressbook.csv`
			do
				number=`echo "$line" | cut -c1`
				if [ $number -eq $lineNumber ]
					then
					echo "What would you like to change it to? Use the format:"
					echo "\"Last name,first name,email,phone number\" (no quotes or spaces)."
					read edit
					lineChange="${lineNumber}s"
					sed -i -e "$lineChange/.*/$edit/" addressbook.csv
					echo
					echo "Contact updated successfully!"
				fi
			done
		fi
		echo
	done		
}

# delete a record - no parameters
# search using either email or last name
deleteContact()
{
	echo 
	while true
	do
		echo "Enter any search term, e.g. last name or email address."
		echo "Enter data or q to quit"
		read rInput
		if [ "$rInput" == 'q' ]
			then
			break
		fi
		echo
		echo "Listing contacts for \"$rInput\":"
        # searching for a record
		grep -n "$rInput" addressbook.csv
		RETURNSTATUS=`echo $?`
        # did not find anything
		if [ $RETURNSTATUS -eq 1 ]
			then
			echo "No contacts found for \"$rInput\""
        # found some records
		else
			echo
			echo "Enter the line number (the first number of the entry) of the record you want to remove."
			read lineNumber
            echo
            # loop and display the results
			for line in `grep -n "$rInput" addressbook.csv`
			do
				number=`echo "$line" | cut -c1`
				if [ $number -eq $lineNumber ]
					then
					lineRemove="${lineNumber}d"
					sed -i -e "$lineRemove" addressbook.csv
					echo "Contact removed from the address book."
				fi
			done
		fi
		echo
	done
}


# start of program

# checking to make sure the .csv file ends with newline character
echo
lastCharOfFile=`tail -c 1 addressbook.csv`
if [ -n "$lastCharOfFile" ]
	then
	echo >> addressbook.csv
fi
# instructions
echo "Hey, welcome to your address book!"
echo "Select an action to perform:"
echo "add) to add a record"
echo "search) to search 1 or more contacts"
echo "edit) to edit a record"
echo "remove) to remove a single record"
echo "all) display all contacts"
echo
read input

# switch statement to determine what to do
case $input in
	add) newContact;;
	search) searchContact;;
	edit) editContact;;
	remove) deleteContact;;
	all) displayAll;;
esac

# end of program
echo
cat <<EOF   
Changed saved and address book closed. Bye!
EOF
echo