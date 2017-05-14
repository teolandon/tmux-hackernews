#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Uses news.sh to acquire current headline
# then formats it, and replaces all #{headline}
# instances with the formatted headline. 

# NOTE: make more modular, less hardcoding, so
# that it's more easily configurable.

headline="#(bash $DIR/scripts/news.sh)"

formatted_headline="#[fg=colour233,bg=colour208] ${headline} "

current_status="$(tmux show-option -gqv status-right)"

new_status="${current_status/\#\{headline\}/${formatted_headline}}"

tmux set-option -gq status-right "$new_status"

tmux bind \> run "$DIR/scripts/inc.sh"\\\; refresh-client -S
tmux bind \< run "$DIR/scripts/dec.sh"\\\; refresh-client -S
