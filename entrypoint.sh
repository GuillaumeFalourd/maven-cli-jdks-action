#!/bin/bash

set -e

if [[ -z $DIRECTORY_PATH ]]; 
then
    echo "DIRECTORY_PATH env isn't set. Running in current directory"
else
    echo "Moving to specified directory path"
    cd $DIRECTORY_PATH
fi

echo "Executing command: mvn $1"

sh -c "mvn $1"