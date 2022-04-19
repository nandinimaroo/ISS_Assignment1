#!/bin/bash
while IFS= read -r line
do
if [ -z "$line" ]
then
echo "" >> speech.txt
else
n=$(echo $line | awk 'END {print $(NF-1), $NF}')
line2="${line% ~*}"
line2="${line2%~*}"
n=$(echo "${n#*~}" | xargs)
echo "${n##*()} once said,"'"'"$line2"'"' >> speech.txt
fi
done < $1