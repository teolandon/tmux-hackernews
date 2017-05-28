#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

. $DIR/variables.sh

if [ -z $offset ] || [ $offset -lt 1 ]; then
  tmux set -g @hackernews-offset '29'
  offset=29
  exit
fi

offset=$((($offset-1)%30))

tmux set -g @hackernews-offset $offset
