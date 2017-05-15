#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Uses news.sh to acquire current headline
# then formats it, and replaces all #{headline}
# instances with the formatted headline. 

# NOTE: make more modular, less hardcoding, so
# that it's more easily configurable.

headline="#(bash $DIR/scripts/news.sh)"

getstatus() { # Takes an argument and returns formatted
              # status. Tested options are status-right
  option=$1   # and status-left

  current_status="$(tmux show-option -gqv $option)"

  echo "${current_status/\#\{headline\}/${headline}}"

}

tmux set-option -gq status-right "$(getstatus "status-right")"

tmux set-option -gq status-left "$(getstatus "status-left")"

# Keybinds; Feel free to customize them

tmux bind \> run "$DIR/scripts/inc.sh"\\\; refresh-client -S
tmux bind \< run "$DIR/scripts/dec.sh"\\\; refresh-client -S

tmux bind C-h new-window "w3m $($DIR/scripts/urls.sh)"
