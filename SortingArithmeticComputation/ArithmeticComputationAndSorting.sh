#!/bin/bash -x
read a
read b
read c
declare -A data 
data[v]=$((a+b*c))
data[x]=$((a*b+c))
data[y]=$((c+a/b))
data[z]=$((a%b+c))
arr="${data[@]}"
arr2=($(echo ${arr[*]}| tr " " "\n" | sort -n))
arr3=($(echo ${arr[*]}| tr " " "\n" | sort -nr))
echo "Computed datas are: " ${data[@]}
echo "Decending order: "${arr3[@]};
echo "Ascending order: "${arr2[@]};
