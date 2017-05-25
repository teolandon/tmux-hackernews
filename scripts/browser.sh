#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

browser=$(tmux show-option -gqv @hackernews-browser)

echo $browser
