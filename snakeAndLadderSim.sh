#!/bin/bash 
NUM_OF_PLAYERS=1
START_POSITION=0
rollDice=$((RANDOM%6))
currentPosition=0
IS_LADDER=0
IS_SNAKE=1
IS_NO_PLAY=2
positionDecider=$((RANDOM%3))

ECHO "Dice rolled on $rollDice"

case $positionDecider in 
	$IS_LADDER )
		$currentPosition=$(($currentPosition+$rollDice));
		;;
	$IS_SNAKE )
		$currentPosition=$(($currentPosition-$rollDice));
		;;
	$IS_NO_PLAY )
		echo "STAY STIL...!";
		;;
esac

echo "current position : $currentPosition"
	
	
		