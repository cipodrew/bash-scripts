## Command substitution
for UTENTE in $(cat /etc/passwd | cut -f1 -d:); do
    echo"$UTENTE"
done

## Iterare su indirizzi (da 10.100.2.1 a 10.100.7.254)
for IP in 2.{1..255} {3..6}.{0..255} 7.{0..254} ; do
done

## monitoring processo
while ps ${PID[@]} >/dev/null; do
done
