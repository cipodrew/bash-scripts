#!/bin/bash
cleanExit() { #se segnale arriva durante la sleep può passare del tempo prima che si riattivi e esegua la funzione
    echo "Process backupHome PID:$PID: exiting"
    rm /tmp/backuphome.pid
    exit 0
}

N=0
PID=$$
cd /home/vagrant
#echo $PID
echo $PID > /tmp/backuphome.pid
trap "cleanExit" SIGUSR1 
while true; do
    N=$(( $N+1 ))
    NOME_ARCHIVIO="archivio$N.tar.gz"  #archivio compresso e creato nella working directory
    #line below excludes files that start with archivio or log
    find . -type f ! \( -name 'archivio*' -o -name 'log*' \) | tar -czf "$NOME_ARCHIVIO" --files-from -
#    tar -czf "$NOME_ARCHIVIO" * #archive whole directory
    scp $NOME_ARCHIVIO root@10.1.1.254:/home/vagrant/ > /dev/null 2>&1 #necessita di avere setuppato le chiavi in precedenza 
    sleep 10
done