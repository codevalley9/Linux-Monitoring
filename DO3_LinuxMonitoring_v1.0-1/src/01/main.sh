#!/bin/bash

if ! [ $# -eq 1 ]
    then
        echo "You can write only one word"
else
    re='^([1-9]+)$'
    if [[ $1 =~ $re ]]
        then
            echo "Please, write word"
        else
            echo $1
    fi
fi