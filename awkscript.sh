#!/bin/bash
INT_TOT=0
DECIMAL_TOT=0

ps aux | awk '$4 > 0.3 {print "PID: " $2 " " $4 " " substr($0, index($0, $11))}' | while read PREFIX PID RAM COMMAND; do
echo $RAM $INT_TOT,$DECIMAL_TOT
read INT DECIMAL < <(echo $RAM | tr '.' ' ')
#echo $RAM | tr '.' ' ' | read INT DECIMAL
echo spezzati $INT $DECIMAL
echo totale spezzato $INT_TOT $DECIMAL_TOT
INT_TOT=$(( $INT_TOT + $INT ));
DECIMAL_TOT=$(( $DECIMAL_TOT + $DECIMAL ));
echo $INT_TOT $DECIMAL_TOT >> /home/vagrant/ramfile;
echo totale dopo somma $INT_TOT $DECIMAL_TOT | head 
done
echo $PREFIX #dovrebbe stampare riga vuota poichè la shell di read si chiude con la fine del while e perde le variabili salvate per quella subshell

