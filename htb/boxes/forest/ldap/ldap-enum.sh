#!/usr/bin/env bash


target=$1
#ldapsearch -H ldap://forest.htb.local -x -s base -b "cn=users,dc=htb,dc=local" objectclasses attributestypes

echo "Trying to get name context"

output=`ldapsearch -x -h $target  -s base namingcontexts | grep -i 'namingContexts:'` 2> /dev/null

if [ $? -eq 0 ]; then
	namingcontext=`echo "$output" | head -n1 | cut -d' ' -f 2`
	echo "using namingcontext $namingcontext"
	echo "getting facts.."

	output=`ldapsearch -x -h $target -s base -b "$namingcontext"`
	echo "password policy"
	echo "$output" | grep Pwd

	echo "try to enumerate users"
	output=`ldapsearch -x -h $target -b "$namingcontext" \
		"(&(objectcategory=person)(objectclass=user))" \
		primaryGroupID userPrincipalName sAMAccountName userPassword ufn badPwdcount` 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "$output" | grep -A4 -B2 'dn:'
	else
		echo "Unabale to get users info"
	fi
else
	echo "Unable to get namingcontexts"
	exit 1
fi
