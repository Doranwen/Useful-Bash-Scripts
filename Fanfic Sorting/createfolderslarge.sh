#!/bin/bash

echo "Folder name for fandom:"
read folder

find . -type f | while read -r filename; do
     if [[ "$filename" == *".epub"* ]] ; then
     echo "$filename" | grep -Po '(?<= by )(?!.* by ).*?(?=\.epub)' | while read -r aname; do
          letter="${aname:0:1}"
          if ! [[ "${letter}" =~ [^a-zA-Z] ]]; then
               uletter="${letter^^}"
          else
               if [[ "$letter" =~ ^[0-9]+$ ]]; then
                    uletter="0-9"
               else
                    uletter="_-"
               fi
          fi
          if [[ "$(find . -name "*$aname*" | wc -l)" -gt 0 ]]; then
               if [ -d "../${folder}/${uletter}/${aname}/" ]; then
                    echo "Already exists: ${aname}"
               else
                    echo "Creating: ${aname}"
                    mkdir -p "../${folder}/${uletter}/${aname}/"
               fi
          else
          :
          fi
     done
     else
     :
     fi
done


