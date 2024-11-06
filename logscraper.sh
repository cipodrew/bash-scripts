#!/bin/bash
FOUND=0
while [[ $FOUND -eq 0 ]]; do
#    if sudo grep -w "FLAG" /var/log/myevents.log > /dev/null 2>&1; then
    if grep -w "FLAG" /home/vagrant/logfile > /dev/null 2>&1; then
        PID_TARGET_PROCESS=$(cat /tmp/backuphome.pid)
        kill -10 $PID_TARGET_PROCESS; #SIGUSR1 al processo indicato
        FOUND=1
    fi
sleep 2
done
echo logscraper terminated