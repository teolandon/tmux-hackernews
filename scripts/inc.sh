#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

offset=$(tmux show -gqv @hackernews-offset)

if [ -z $offset ]; then
  tmux set -g @hackernews-offset '1'
  offset=1
  exit
fi

offset=$(($offset+1))

tmux set -g @hackernews-offset $offset
