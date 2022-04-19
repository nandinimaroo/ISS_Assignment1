#!/bin/bash
change()
{   
aa=$1
ab=$(printf "%d" "'$aa")
((ab++))
if [[ $ab -eq 123 ]]
then 
ab=97
fi
if [[ $ab -eq 91 ]]
then 
ab=65
fi
printf "\\$(printf '%03o' "$ab")"
}
inp=$1
echo "$inp" | rev
n=${#inp}
m=n/2
read -a str <<< $(echo "$inp" | rev |sed  's/\(.\)/\1 /g')
for ((i=0;i<$n;++i))
do
    change ${str[$i]}
done
echo ""
echo "$(echo "${inp:0:m}" | rev)""${inp:m:n}"