#!/bin/bash

set -e

if [[ -z $DIRECTORY ]]; 
then
    echo "DIRECTORY env isn't set. Running in current directory"
else
    echo "Moving to specified directory path"
    cd $DIRECTORY
fi

echo "Executing command: mvn $1"

sh -c "mvn $1"