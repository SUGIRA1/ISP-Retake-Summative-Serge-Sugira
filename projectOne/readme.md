# Address Book Shell Script
This is a simple shell script to simulate a contact book.

It has the following capabilities:
- Adding a record
- Display one or more contacts
- Editing a record
- Remove a single record
- Search for contacts

## Thought Process
While starting out this project, I first listed down the required  
functionalities for the contact book.
The most important functionalities I thought of was adding a record.  

I started to think about how that logic would go.  
I concluded that I would have to ask the user for the details  
of a contact then save the details in one line. I line would represent one contact.  

For the details of a contact, I will required first name,   
last name, email and phone number. For easier retrieving and 
operations, I will require that new contact details be entered one   
after another, without spaces, separated by a comma.

I decided to save the contacts in csv file. When I get new information, or contact,  
I redirect input to the csv file for persistence.  

I created 5 functions to perform different actions,   
adding a record, display a record, editing a record,   
remove a single record and search for a contact.   
All the functions will not be taking any parameters.   

The approach for the functions was the same.   
I used the do while loop. This enable the user to perform an   
action and only exit the action/function when done by typing q.   

For the searching operations, I will display the found records in lines each.   
I will have the line number of the record next to it for easier manipulation.   

## running the script

cd to projectOne folder.  
```cd projectOne```   
give the bash file executing permissions using   
```chmod +x book.sh```  
run the script using  
```./book.sh```   