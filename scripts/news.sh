#!/bin/bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Periodically print out
# Top 10 Headlines from Hackernews

index=`. $DIR/compute_index.sh`

headline=`grep ^headline $DIR/../vars.conf | sed "s/.*=//g"`

p_index=`echo $headline | sed "s/\..*//g"`

if [ $p_index == $index ]; then
  echo $headline
  exit
fi

headline=`curl -s https://news.ycombinator.com | grep "<a.*class=\"storylink\"" | sed -e "s/<td.*storylink\">\|<\/a.*\|<td align.*div>\|<td align.*nofollow\">//g" -e "s/^ *//g" -e "${index}q;d"`

max_chars=`grep max_chars $DIR/../vars.conf | sed "s/.*=//g"`

if [ -n "${headline:$max_chars}" ]
then
  headline=${headline:0:$(($max_chars - 3))}'...'
fi

sed -i "s/headline=.*/headline=${index}. ${headline}/g"

echo ${index}. ${headline}
