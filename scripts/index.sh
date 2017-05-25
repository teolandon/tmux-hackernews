#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

hours=`date +%H`
hours=${hours#0} # remove leading 0s
minutes=`date +%M`
minutes=${minutes#0} # remove leading 0s

offset=$(tmux show-option -gqv @hackernews-offset)

if [ -z $offset ]; then
  offset=0
fi

index=$((15*($hours%2)+($minutes/4)+$offset))

echo $((($index%30)+1))
