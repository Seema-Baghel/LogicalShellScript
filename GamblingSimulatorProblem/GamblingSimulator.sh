#!/bin/bash
declare -A cashwon
declare -A cashlost
stake=100
lossStake=$(($stake/2))
winStake=$(($stake*3/2))
bet=1
totalwins=0
totalloss=0
day="Day"
totalcash=0
echo "day  wins  loss"
for ((i=1;i<=20;i++))
do
	cash=stake
        wins=0
	loss=0
	while (($cash>0))
	do
		if ((RANDOM%10>5))
		then
                	((wins++))
                	((cash++))
		else
                	((loss++))
                	((cash--))
		fi
		if (($cash==$winStake||$cash==$lossStake))
		then
			break
		fi
	done
	if (($wins>$loss))
	then
		cashwon["$i"]=$(($cash-$stake))
	else
		cashlost["$i"]=$(($stake-$cash))
	fi
	totalcashwon=$(($totalcash+$cash-$stake))
	totalwins=$(($totalwins+$wins))
	totalloss=$(($totalloss+$loss))
	cashwonday[$i]=$wins
	everycashwon[$i]=$wins
	cashlostday[$i]=$loss
        everycashlost[$i]=$loss
        echo "day$i  $wins  $loss"
done

luckday=$( printf "%s\n" ${cashwonday[@]} | sort -nr | head -1)
echo "highest wins : $luckday"

for ((k=1;k<=${#everycashwon[@]};k++))
do
	if (( $luckday=="${everycashwon[$k]}" ))
	then
		echo "luckest day : $k"
	fi
done

unluckyday=$( printf "%s\n" ${cashlostday[@]} | sort -nr | tail -1)
echo "maximun loss : $unluckyday"

for ((k=1;k<=${#everycashlost[@]};k++))
do
        if (( $unluckyday=="${everycashlost[$k]}" ))
        then
                echo "unluckiest day : $k"
        fi
done
if (($(($totalwins-$totalloss)) < (($stake*10))))
then
	echo "Eligible for next month";
else
	echo "Not Eligible for next month";
fi
