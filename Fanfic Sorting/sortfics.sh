#!/bin/bash

echo "Folder name for fandom: "
read folder

find "../${folder}" -mindepth 1 -type d | grep -Po '(?<=\/)(?!.*\/).*' | while read -r author; do
     find ./ -name "* by ${author}.*" -type f | while read -r filename; do
          if [ -f "../${folder}/${author}/${filename}" ]; then
              echo "Already exists: ${filename}"
          else
          mv -n -v "${filename}" "../${folder}/${author}/"
          fi ;
     done ;
done

