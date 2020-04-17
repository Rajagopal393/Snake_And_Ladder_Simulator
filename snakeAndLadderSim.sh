#!/bin/bash 
NUM_OF_PLAYERS=2
START_POSITION=0
currentPosition=0
IS_LADDER=0
IS_SNAKE=1
IS_NO_PLAY=2
WINNING_POSITION=100
timesDiceRolled=0
declare -A playerPosition


makingMove(){

        timesDiceRolled=$(($timesDiceRolled+1))
        rollDice=$((RANDOM%6+1))
        positionDecider=$((RANDOM%3))
        case $positionDecider in
            $IS_LADDER )
                playerPosition[$player]=$((${playerPosition[$player]}+$rollDice))
                if [ ${playerPosition[$player]} -gt $WINNING_POSITION ]
                then
			playerPosition[$player]=$((${playerPosition[$player]}+0))
                    else
                        playerPosition[$player]=$((${playerPosition[$player]}+$rollDice));
                fi
                ;;
            $IS_SNAKE )
                playerPosition[$player]=$((${playerPosition[$player]}-$rollDice))
                if [ ${playerPosition[$player]} -lt $START_POSITION ]
                    then
                        playerPosition[$player]=$START_POSITION
                else
                        playerPosition[$player]=$((${playerPosition[$player]}-$rollDice));
                fi
                ;;
            $IS_NO_PLAY )
                playerPosition[$player]=$((${playerPosition[$player]}+0))
                ;;
        esac
    
}
gameStatus=0
gameOver=0
findingWinner(){
	
	while [ $gameStatus -eq $gameOver ]
	do
		for (( player=1; player<=$NUM_OF_PLAYERS; player++ ))
			do
				makingMove
				if [ ${playerPosition[$player]} -eq $WINNING_POSITION ]
				then
					winner=$player
					gameOver=1
					break;
			fi
		done
	done
}

findingWinner

echo "Winner is Player number : $winner"

	
	
		
