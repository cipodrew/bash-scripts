#### Parallelo N processi ###
N=0
for CMD in "$@"; do
    N=$(($N + 1))
    $CMD &
    PID[$N]=$! # salvo PID
    NOME[$N]="$CMD"
done
### Finché processo attivo ###
while ps ${PID[@]} >/dev/null; do
	sleep 1
	echo "almeno uno dei processi ${PID[@]} è ancora in esecuzione"
done
echo "finito"
