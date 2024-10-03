#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER=$(($RANDOM % 1000 + 1))
TRIES=1

GUESSING_GAME () {
  if [[ $1 ]]
  then
    echo "$1"
  fi
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    ((TRIES++))
    GUESSING_GAME "That is not an integer, guess again:"
    return 0
  fi

  if (( $GUESS > $NUMBER ))
  then
    ((TRIES++))
    GUESSING_GAME "It's lower than that, guess again:"
    return 0
  elif (( $GUESS < $NUMBER ))
  then
    ((TRIES++))
    GUESSING_GAME "It's higher than that, guess again:"
    return 0
  fi
  echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
  INSERT_GAME_RES=$($PSQL "insert into games(user_id, tries) values ($USER_ID, $TRIES)")
}


echo -e "\n~~Number guessing game~~\n"

echo "Enter your username:"
read USERNAME;
USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
echo $USERINFO
if [[ -z $USER_ID ]]
then
  INSERT_USER_RES=$($PSQL "INSERT INTO USERS (NAME) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAME_INFO=$($PSQL "select count(1), min(tries) from games where user_id=$USER_ID")
  echo "$GAME_INFO" | while IFS="|" read TOTAL BEST
  do
    echo "Welcome back, $USERNAME! You have played $TOTAL games, and your best game took $BEST guesses."
  done 
fi
echo "Guess the secret number between 1 and 1000:"
GUESSING_GAME