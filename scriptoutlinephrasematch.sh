#!/bin/bash

# ask for number of words to match at a time
# for each line of a file
# remove punctuation and numbers and convert to lowercase
# take each word one at a time and compare with wordlist document to see if there's a match
# if yes, store word in temp storage and proceed to next word
# if no (or no next word), check temp storage for number of words and see if it equals or exceeds number given at beginning
   # if yes, store phrase in output file and empty temp storage
   # if no, empty temp storage

file="$1"
list="$2"
declare -i count=0
declare stringmatching
function resetvars {
    count=0; #set counter back to 0
    stringmatching=""; # empty stringmatching so it has no words in it
}
function falsematch {
    if [ $count -ge "$goal" ]; then  # check if count is equal to or greater than our goal
        echo "$stringmatching" >> phrasematches.txt; # print matching string and store in output file
        echo "$line" >> phrasematches.txt; # print line source and store in output file
        echo -e "" >> phrasematches.txt; # add new line to end of output file to make it easier to see separate matches
        resetvars
    else
        resetvars
    fi;
}
echo "Enter minimum number of words in matching phrase: "
read -r goal
while [[ $goal =~ [^0-9]+$ ]]; do
    echo "This is not an integer."
    echo -n "Please enter an integer: "
    read -r goal
done
while read -r line; do # for each line of a file
lineedit=$(echo "$line" | sed -r 's/[^[:space:]]*[0-9][^[:space:]]* ?//g'  | sed -r 's/-/ /g'  | tr -d "[:punct:]" | tr "[:upper:]" "[:lower:]" ) # remove punctuation and numbers and convert to lowercase
  for word in $lineedit; do # take each word one at a time
    if (grep -q -m 1 "\b$word\b" "$list"); then # compare with wordlist document to see if there's a match
        count=$(( count + 1 ))  # if yes, increment counter
        if test -z "$stringmatching" ; then
            stringmatching="${word}"  # store word in temp storage and proceed to next word
        else
            stringmatching="${stringmatching} ${word}"  # store space and word in temp storage and proceed to next word
        fi;
    else  # if word does not match
        falsematch
    fi;
  done;
falsematch;
done < "$file"
