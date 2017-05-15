#!/bin/bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Periodically print out
# Top 10 Headlines from Hackernews

index=`. $DIR/compute_index.sh`

headline=`curl -s https://news.ycombinator.com | grep "<a.*class=\"storylink\"" | sed -e "s/<td.*storylink\">\|<\/a.*\|<td align.*div>\|<td align.*nofollow\">//g" -e "s/^ *//g" -e "${index}q;d"`

if [ -n "${headline:72}" ]
then
  headline=${headline:0:69}'...'
fi

echo ${index}. ${headline}
