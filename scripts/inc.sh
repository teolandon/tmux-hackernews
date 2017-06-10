#!/bin/bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# get variables
. $DIR/variables.sh

if [ -z $offset ]; then
  tmux set -g @hackernews-offset '1'
  offset=1
  exit
fi

offset=$((($offset+1)%30))

tmux set -g @hackernews-offset $offset
