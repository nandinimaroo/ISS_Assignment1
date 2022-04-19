#!/bin/bash
inp=$1
echo "$inp" | tr "," "\n" > temp.txt
arr=()
while IFS= read -r line 
do
arr+=($line)
done < temp.txt
for ((i=0;i<${#arr[@]};i++))
do 
for ((j=$i + 1;j<${#arr[@]};j++))
do
if [[ ${arr[$i]} -gt ${arr[$j]} ]]
then
m=${arr[$i]}
arr[$i]=${arr[$j]}
arr[$j]=$m
fi
done 
done
echo "${arr[@]}"
rm temp.txt
