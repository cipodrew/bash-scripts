#!/bin/bash
IP_SERVER=10.2.2.254;
PID_TARGET_PROCESS=$(cat /tmp/myscript.pid)
echo "debug: $PID_TARGET_PROCESS"
read STATE RECVQ SENDQ LOCALADDRPORT PEERADDPORT PROCESS < <(snmpget -v 1 -c public $IP_SERVER NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"sshd\" | awk '{print substr($0, index($0, $4))}') #stampa output del comando remoto di label sshd ma scarta i primi campi che sono realativi a SNMP
echo "debug: $PROCESS"
echo "debug: $STATE"
lower_STATE=$(echo "$STATE" | tr '[:upper:]' '[:lower:]')
if [[ $lower_STATE == "prova" || $lower_STATE == "listen" ]]; then  
  echo "listening"
  kill -10 $PID_TARGET_PROCESS #-10 = SIGUSR1
else  
  echo "not listening"  
fi
