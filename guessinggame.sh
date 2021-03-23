usr/bin/env bash
# File: guessinggame.sh

function count_files {
  echo $(ls -A1p | egrep -v / | wc -l)
}

echo "Welcome to the Guessing Game!"

file_count=$(count_files)
while [[ ! $correct_guess ]]
do
  echo "Please guess of the number of files in the current directory:"
  read guess

  if [[ $guess =~ ^[0-9]+$ ]]
  then
    if [[ $guess -gt $file_count ]]
    then
      echo "Your guess was too high!"
    elif [[ $guess -lt $file_count ]]
    then
      echo "Your guess was too low!"
    else
      echo "You guessed correctly"
      let correct_guess=true
    fi
  fi
done
