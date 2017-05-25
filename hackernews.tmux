#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Uses news.sh to acquire current headline
# then formats it, and replaces all #{headline}
# instances with the formatted headline.

headline="#(bash $DIR/scripts/news.sh)"

if [ -z "$headline" ]; then
  headline="Error acquiring headline"
fi

format_status() { # Takes an argument and returns formatted
                # status. Tested options are status-right
  option=$1     # and status-left

  current_status="$(tmux show-option -gqv $option)"

  echo "${current_status/\#\{headline\}/${headline}}"

}

tmux set-option -gq status-right "$(format_status "status-right")"

tmux set-option -gq status-left "$(format_status "status-left")"

# Set options, only if they're not already set (-o flag)
tmux set-option -gqo @hackernews-offset 0
tmux set-option -gqo @headline-max-chars 80

# Keybinds; Feel free to customize them

tmux bind \> run "$DIR/scripts/inc.sh"\\\; refresh-client -S
tmux bind \< run "$DIR/scripts/dec.sh"\\\; refresh-client -S

browser=$($DIR/scripts/browser.sh)

if [ -n "$browser" ]; then
  if type "$browser" > /dev/null; then
    tmux bind h new-window "$browser \$(bash $DIR/scripts/urls.sh)"
  fi
elif which xdg-open > /dev/null; then
  tmux bind h run-shell "xdg-open \$(bash $DIR/scripts/urls.sh)"
fi
