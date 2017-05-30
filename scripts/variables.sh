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
period=$(read_tmux_var @hackernews-period 2)

curr_hour=`date +%H`
curr_hour=${curr_hour#0} # remove leading 0s
curr_minute=`date +%M`
curr_minute=${curr_minute#0} # remove leading 0s

index=$(((30/$period)*($curr_hour%$period)+($curr_minute/(2*$period))+$offset))

index=$(((index%30)+1))
