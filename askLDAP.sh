#!/bin/bash

echo "gruppi disponibili:"
ldapsearch -LLL -x -b "ou=Groups,dc=labammsis" -s one | grep ^dn: | while read Garbage GroupName ; do
echo "$GroupName" 
done
