#!/bin/bash

# munge a series of CSVs into one big CSV
# takes the name of what will be the concatenated CSV

OUT_FILE_NAME=$1
i=0

for FILE_NAME in ./*.csv; do
    if [ "$FILE_NAME"  != "$OUT_FILE_NAME" ] ;
    then
        # echo "about to concat $FILE_NAME"
        if [[ $i -eq 0 ]] ; then
            head -1  $FILE_NAME >   $OUT_FILE_NAME
        fi
        tail -n +2  $FILE_NAME >>  $OUT_FILE_NAME # append from 2nd line of file
        i=$(( $i + 1 ))                           # increment
    fi
done
