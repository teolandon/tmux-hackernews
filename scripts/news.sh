#!/bin/bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Periodically print out
# Top 10 Headlines from Hackernews

index=`. $DIR/compute_index.sh`

# if [ -r $DIR/../headlines.conf -a $index != 1 ]; then
  # echo `sed "${index}q;d" $DIR/../headlines.conf`
  # exit
# fi

headlines=$(curl -s https://news.ycombinator.com | grep "<a.*class=\"storylink\"" | sed -e "s/<td.*storylink\">\|<\/a.*\|<td align.*div>\|<td align.*nofollow\">//g" -e "s/^ *//g")

if [ -z "$headlines" ]
then
  echo $headlines
  exit
fi

echo "$headlines" > $DIR/../headlines.conf

headline=`sed "${index}q;d" $DIR/../headlines.conf`

max_chars=`grep max_chars $DIR/../vars.conf | sed "s/.*=//g"`

if [ -n "${headline:$max_chars}" ]; then
  headline=${headline:0:$(($max_chars - 3))}'...'
fi

sed -i "s/headline=.*/headline=${index}. ${headline}/g" $DIR/../vars.conf

echo ${index}. ${headline}
