#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "truncate teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR == "year" ]]
  then
    continue 1
  fi
  #echo $YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS
  WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
  OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
  if [[ -z $WINNER_ID ]]
  then
    echo "inserting $WINNER into teams..."
    echo $($PSQL "insert into teams (name) values ('$WINNER')")
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
  fi
  if [[ -z $OPPONENT_ID ]]
  then
    echo "inserting $OPPONENT into teams..."
    echo $($PSQL "insert into teams (name) values ('$OPPONENT')")
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
  fi
  echo "inserting row into games"
  echo $($PSQL "insert into games (year, round, winner_goals, opponent_goals, winner_id, opponent_id) values ($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
done