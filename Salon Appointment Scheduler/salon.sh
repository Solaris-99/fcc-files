#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c "
echo -e "\n~~~ WELCOME TO THE SALOON ~~~"
SHOW_SERVICES () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICES=$($PSQL "select service_id, name from services order by service_id")
  echo "$SERVICES" | while read ID BAR SERVICE
  do
    echo "$ID) $SERVICE"
  done
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SHOW_SERVICES "That is not a valid service"
    return 0
  fi
  SERVICE_ID="$($PSQL "select service_id from services where service_id = '$SERVICE_ID_SELECTED'")"
  if [[ -z $SERVICE_ID ]]
  then
    SHOW_SERVICES "I could not find that service. What would you like today?"
    return 0
  fi

  #user handling
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    #create user
    echo -e "\nWhat is your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE') ")
  fi
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  
  #create appointment
  echo -e "\nWhat time would you like your cut, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')"
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments (customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID")
  
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

}



SHOW_SERVICES