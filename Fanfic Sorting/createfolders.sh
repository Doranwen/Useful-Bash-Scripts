#!/bin/bash

echo "Folder name for fandom: "
read folder

find . -type f | while read -r filename; do
     if [[ "$filename" == *".epub"* ]] ; then
     echo "$filename" | grep -Po '(?<= by )(?!.* by ).*?(?=\.epub)' | while read -r aname; do
          if [[ "$(find . -name "*$aname*" | wc -l)" -gt 0 ]]; then
               if [ -d "../${folder}/${aname}/" ]; then
                    echo "Already exists: ${aname}"
               else
                    echo "Creating: ${aname}"
                    mkdir -p "../${folder}/${aname}/"
               fi
          else
          :
          fi
     done
     else
     :
     fi
done
