#!/bin/bash

if [[ $# != 1 ]]; then
       	echo "usage: unico argomento = nome del file da floodare"
	exit 1
fi
echo "$BASHPID: flooding file $1"
NUM=0
while true; do
	NUM=$(( $NUM + 1 ))
	echo "Flooding $NUM" >> $1
	sleep 2
done
