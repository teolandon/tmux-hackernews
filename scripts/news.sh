#!/bin/bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Periodically print out
# Top 10 Headlines from Hackernews

index=`. $DIR/compute_index.sh`

# If headlines file exists and index is not 1, then just read from there
if [ -r $DIR/../headlines.conf -a $index != 1 ]; then
  echo $index. `sed "${index}q;d" $DIR/../headlines.conf`
  exit
fi

# else, pull from news.ycombinator.com

request=`curl -s https://news.ycombinator.com | grep "<a.*class=\"storylink\""`

headlines=$(echo "$request" | sed -e "s/<td.*storylink\">\|<\/a.*\|<td align.*div>\|<td align.*nofollow\">//g" -e "s/^ *//g")

# If nothing returns, then simply return NULL
if [ -z "$headlines" ]
then
  echo $headlines
  exit
fi

# links to append
storylinks=$(echo "$request" | sed -e "s/.*<td class=\"title\"><a href=\"//g" -e "s/\" class=\"storylink\">.*//g")

# Write to the headlines file
echo "$headlines" > $DIR/../headlines.conf
echo "$storylinks" >> $DIR/../headlines.conf

headline=`sed "${index}q;d" $DIR/../headlines.conf`

max_chars=`grep max_chars $DIR/../vars.conf | sed "s/.*=//g"`

if [ -n "${headline:$max_chars}" ]; then
  headline=${headline:0:$(($max_chars - 3))}'...'
fi

sed -i "s/headline=.*/headline=${index}. ${headline}/g" $DIR/../vars.conf

echo ${index}. ${headline}
