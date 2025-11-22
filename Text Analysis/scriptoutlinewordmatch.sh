#!/bin/bash

# for each line of a file
# remove punctuation and numbers and convert to lowercase
# take each word one at a time and compare with wordlist document to see if there's a match
# if yes, proceed to next word (store line in output file if there is no next word)
# if no, abandon line and proceed to next line

file="$1"
list="$2"
flag="FALSE"
while read line; do # for each line of a file
lineedit=$(echo "$line" | sed -r 's/[^[:space:]]*[0-9][^[:space:]]* ?//g'  |  sed -r 's/-/ /g'  | tr -d [:punct:] | tr [:upper:] [:lower:]) # remove punctuation and numbers and convert to lowercase
  for word in $lineedit; do # take each word one at a time
    if ! (grep -q -m -w 1 "$word" "$list"); then # compare with wordlist document to see if there's a match
        flag="FALSE"
        break;  # if no, abandon line and proceed to next line
    fi; # if yes proceed to next word
    flag="TRUE"
  done;
  if [[ "$flag" == "TRUE" ]]; then
    echo "$line" >> linematches.txt;  # print line & store in output file if there is no next word
    flag="FALSE"
   fi;
done < "$file"
