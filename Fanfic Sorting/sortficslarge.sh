#!/bin/bash

echo "Folder name for fandom:"
read folder

find "../${folder}" -mindepth 2 -type d | grep -Po '(?<=\/)(?!.*\/).*' | while read -r author; do
     letter="${author:0:1}"
     if ! [[ "${letter}" =~ [^a-zA-Z] ]]; then
          uletter="${letter^^}"
     else
          if [[ "$letter" =~ ^[0-9]+$ ]]; then
               uletter="0-9"
          else
               uletter="_-"
          fi
     fi
     find ./ -name "* by ${author}.*" -type f | while read -r filename; do
          if [ -f "../${folder}/${uletter}/${author}/${filename}" ]; then
              echo "Already exists: ${filename}"
          else
              mv -n -v "${filename}" "../${folder}/${uletter}/${author}/"
          fi ;
     done ;
done








