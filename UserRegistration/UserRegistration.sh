#!/bin/bash -x
echo "Enter User Details:"
#.........................................
function isFnameValid()
{
	local fname=$1
	local checkFname="[A-Z]{1}[a-z]{3,}$"
	if [[ $fname =~ $checkFname ]];
	then
		FirstName="$fname";
	else
		FirstName="Invalid";
	fi
	echo $FirstName;
}
#...........................................
function isLnameValid()
{
	local lname=$1
	local checkLname="[A-Z]{1}[a-z]{3,}$"
	if [[ $lname =~ $checkLname ]];
	then
		LastName="$lname";
	else
		LastName="Invalid";
	fi
	echo $LastName;
}
#.....................................
function isMailValid()
{
	local email=$1
	local checkEmail="[a-zA-Z0-9]{3,}[.,@][a-zA-Z]{5,}[.,][a-z]{2,3}[.][a-z]{2,3}$"
	if [[ $email =~ $checkEmail ]];
	then
		Email="$email"
	else
		Email="Invalid";
	fi
	echo $Email;
}
#...................................
function isPhnoValid()
{
	local phn=$1
	local checkPhn="[0-9]{2}[ ]?[0-9]{10}"
	local length=${#phn}
	if [[ $phn =~ $checkPhn ]] && [[ $length -eq 10 ]] 
	then
		Phno="$phn"
	else
		Phno="Invalid"
	fi
	echo $Phno;
}
#.......................................
function isPasswordValid()
{
	local password=$1
	local length="${#password}"
	if [ $length -ge 8 ] ;
	then
    		echo "$password" | grep -q [0-9]
     		if [ $? -eq 0 ] ; 
		then
           		echo "$password" | grep -q [A-Z]
                	if [ $? -eq 0 ] ; 
			then
                    		echo "$password" | grep -q [a-z]   
                       		if [ $? -eq 0 ] ; 
				then
	                    		echo "$password" | grep -q "[!@#$%^&*]"
					if [ $? -eq 0 ] ; 
					then
                      				echo "Strong password"
                   			else
                   	    			echo "weak password include special char"
                   			fi
            			else
               				echo "weak password include lowercase char" 
            			fi
			else
                        	echo "weak password include Capital char"
                	fi
     		else
			echo "please include the numbers in password"   
     		fi
	else
		echo "password lenght should be greater than or equal 8 hence weak password"
	fi
}
read -p "Enter First Name:" fname
isFnameValid $fname
read -p "Enter Last Name:" lname
isLnameValid $lname
read -p "Enter the email:" email
isMailValid $email
read -p "Enter Mobile number:" phn
isPhnoValid $phn
read -p "please enter password:" password
isPasswordValid $password

