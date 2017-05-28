#!/usr/bin/env bash

read_tmux_var()
{
  variable=$1
  default=$2

  ret=$(tmux show-option -gqv "$variable")

  if [ -z $ret ]; then
    echo $default
  else
    echo $ret
  fi
}

offset=$(read_tmux_var @hackernews-offset 0)
max_chars=$(read_tmux_var @headline-max-chars 80)
browser=$(read_tmux_var @hackernews-browser)
scroll=$(read_tmux_var @hackernews-scroll false)

hours=`date +%H`
hours=${hours#0} # remove leading 0s
minutes=`date +%M`
minutes=${minutes#0} # remove leading 0s

index=$((15*($hours%2)+($minutes/4)+$offset))

index=$(((index%30)+1))
