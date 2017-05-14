#!/bin/bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Periodically print out
# Top 10 Headlines from Hackernews

hours=`date +%H`
hours=${hours#0} # remove leading 0s
minutes=`date +%M`
minutes=${minutes#0} # remove leading 0s

offset=`grep hacknews_offset $DIR/../vars.conf | sed "s/.*=//g"`

index=$((15*($hours%2)+($minutes/4)+$offset))

index=$((index%30 + 1))

headline=`curl -s https://news.ycombinator.com | grep "<a.*class=\"storylink\"" | sed -e "s/<td.*storylink\">\|<\/a.*\|<td align.*div>\|<td align.*nofollow\">//g" -e "s/^ *//g" -e "${index}q;d"`

if [ -n "${headline:72}" ]
then
  headline=${headline:0:69}'...'
fi

echo ${index}. ${headline}
