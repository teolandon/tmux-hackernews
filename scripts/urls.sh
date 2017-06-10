#!/bin/bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
PARENT="$DIR/.."

# get variables
. $DIR/variables.sh

index=$((index+30))

storylink=`sed "${index}q;d" $PARENT/headlines.conf`

if [ "${storylink:0:5}" == "item?" ]; then
  storylink='https://news.ycombinator.com/'"$storylink"
fi

echo $storylink
