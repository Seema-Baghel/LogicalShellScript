#!/bin/bash -x
echo "---------Welcome to Snake and Ladder Game----------"
Game_Winning=100
Player1=0
Player2=0
count1=0
count2=0
while [ $Player1 -lt $Game_Winning ] && [ $Player2 -lt $Game_Winning ]
do
        playonerolldice=$(($((RANDOM%6))+1))
        checkPlayone=$((RANDOM%3))
        if [ $checkPlayone -eq 0 ]
        then
                Player1=$Player1
        elif [ $checkPlayone -eq 1 ]
        then
                  Player1=$(($Player1+$playonerolldice))
                case $Player1 in
                                19)
                                Player1=66
                                ;;
                                32)
                                Player1=53
                                ;;
                                67)
                                Player1=100
                                ;;
                                73)
                                Player1=90
                                ;;
                esac
        elif [ $checkPlayone -eq 2 ]
        then
                 Player1=$Player1
                case $Player1 in
                                26)
                                Player1=6
                                ;;
                                46)
                                Player1=12
                                ;;
                                74)
                                Player1=52
                                ;;
                esac
        fi
	playtworolldice=$(($((RANDOM%6))+1))
        checkPlaytwo=$((RANDOM%3))
	if [ $checkPlaytwo -eq 0 ]
        then
		Player2=$Player2
        elif [ $checkPlaytwo -eq 1 ]
        then
                  Player2=$(($Player2+$playtworolldice))
                case $Player2 in
                                19)
                                Player2=66
                                ;;
                                32)
                                Player2=53
                                ;;
                                67)
                                Player2=100
                                ;;
                                73)
                                Player2=90
                                ;;
                esac
        elif [ $checkPlaytwo -eq 2 ]
        then
                 Player2=$Player2
                case $Player2 in
                                26)
                                Player2=6
                                ;;
                                46)
                                Player2=12
                                ;;
                                74)
                                Player2=52
                                ;;
                esac
        fi
((count1++))
((count2++))
done
if [ $Player1 -eq $Game_Winning  ]
        then
                echo "Player 1 is the Winner and num of turn is $count1"
else
                echo "Player 2 is the Winner and num of turn is $count2"
fi








