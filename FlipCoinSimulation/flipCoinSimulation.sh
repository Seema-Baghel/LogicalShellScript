#!/bin/bash -x
headCounter=0
tailCounter=0
Pattern=0
function flipCoinSimulation()
{
	head=0 tail=0
	local num=$1
	local temp1=$num
	local coinFlip=$2
	local temp2=$coinFlip
	for((i=0;i<$num;i++))
	do
		s=""
        	for((j=0;j<$coinFlip;j++))
        	do
			flip=$((RANDOM%2))
				if(($flip==1))
        			then
                			s=$s"H"
                			head=$(($head+1))
        			else
                			s=$s"T"
                			tail=$(($tail+1))
        			fi
        	done
	patternArray[ ((Pattern++)) ]=$s
	done
echo "No. of heads: $head"
echo "No. of tails: $tail"
headPercent=$(awk -v a=$head -v b=$(($head+$tail)) 'BEGIN {print(a/b*100)}')
tailPercent=$(awk -v a=$tail -v b=$(($head+$tail)) 'BEGIN {print(a/b*100)}')
headArray[ ((headCounter++)) ]=$headPercent
tailArray[ ((tailCounter++)) ]=$tailPercent
echo "Winning Combination of head % of coin: ${headArray[@]} "
echo " Tail Percentage: ${tailArray[@]} "
echo "Fliping result of coin: ${patternArray[@]} "
}

echo "Enter How many time you want to flip the coin for Singlet:"
read num1
echo "For singlet coin:"
coinFlip1=1
flipCoinSimulation $num1 $coinFlip1

#-------------------------------------

echo "Enter How many time u want to flip the coin for doublet:"
read num2
echo "For Doublet :"
coinFlip2=2
flipCoinSimulation $num2 $coinFlip2

#......................

echo "Enter How many time u want to flip the coin for Triplet:"
read num3
echo "For Triplet :"
coinFlip3=3
flipCoinSimulation $num3 $coinFlip3


