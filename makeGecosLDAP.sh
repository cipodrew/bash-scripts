#!/bin/bash

ldapsearch -LLL -x -b "ou=People,dc=labammsis" -s one | grep ^dn: | while read Tipo DN ; do
ldapsearch -LLL -x -b "$DN" -s base | grep '^(sn|mail): ' | sort | ( 
	read tipo MAIL #sort garantisce che la prima riga sia la mail e la seconda il SN
	read tipo SN
	echo dn: $DN
	echo changetype: modify
	echo replace: gecos
	echo gecos: $SN $MAIL
	echo  #riga vuota serve per separare le entry ldif dell'output finale con cui alimentiamo ldapmodify
)
done | ldapmodify -x -D "cn=admin,dc=labammsis" -w gennaio.marzo
