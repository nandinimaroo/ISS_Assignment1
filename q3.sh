#!/bin/bash
file="$1"
size=$(wc --bytes < $file)
lc=$(wc -l < $file)
wc=$(wc -w < $file)
echo "Size of the file in bytes: $size"
echo "Total no. of lines in the file: $lc"
echo "Total no. of words in the file: $wc"
i=1
while read line 
do
count=$(echo "$line" | wc -w)
echo "Line No: $i - Count of Words: $count"
((i++))
done < $file
sed -e 's/[^[:alpha:]]/ /g' $file | tr '\n' " " |  tr -s " " | tr " " '\n' | sort | uniq -c -d > temp.txt
while IFS= read -r line
do
worcnt=$(echo $line | awk 'END {print $(NF-1)}')
word=$(echo $line | awk 'END {print $NF}')
echo "Word: $word - Count of repetition: $worcnt"
done < temp.txt
rm temp.txt
