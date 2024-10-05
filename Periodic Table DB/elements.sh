if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 =~ ^[0-9]+$ ]]
then
  CONDITION="where atomic_number=$1"
else
  CONDITION="where symbol='$1' OR name='$1'"
fi

ELEMENT=$($PSQL "select elements.atomic_number, elements.name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type from elements inner join properties using(atomic_number) inner join types using(type_id) $CONDITION")

if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

echo "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL MASS MELT BOIL TYPE
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
done