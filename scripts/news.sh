#!/bin/bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
PARENT="$DIR/.."

# get variables
. $DIR/variables.sh

# Periodically print out
# Top 10 Headlines from Hackernews

# To be used instead of exit, to always remove the dummy file
# used for dating the headlines.conf file

clean_exit()
{
  rm "$DIR/dummy"
  exit
}

# If headlines file exists and index is not 1, then just read from there
touch -d '-2 hours' $DIR/dummy
if [ -r $DIR/../headlines.conf -a $DIR/../headlines.conf -nt $DIR/dummy ]; then
  echo $index. `sed "${index}q;d" $DIR/../headlines.conf`
  clean_exit
fi

# else, pull from news.ycombinator.com

request=`curl -s https://news.ycombinator.com | grep "<a.*class=\"storylink\""`

headlines=$(echo "$request" | sed -e "s/<td.*storylink\">\|<\/a.*\|<td align.*div>\|<td align.*nofollow\">//g" -e "s/^ *//g")

# If nothing returns, then simply return NULL
if [ -z "$headlines" ]
then
  echo "Error getting headline"
  clean_exit
fi

# links to append
storylinks=$(echo "$request" | sed -e "s/.*<td class=\"title\"><a href=\"//g" -e "s/\" class=\"storylink\">.*//g")

# Write to the headlines file
echo "$headlines" > $DIR/../headlines.conf
echo "$storylinks" >> $DIR/../headlines.conf

headline=`sed "${index}q;d" $DIR/../headlines.conf`

max_chars=$(tmux show-option -gqv @headline-max-chars)

if [ -z $max_chars ]; then
  max_chars=80
fi

if [ -n "${headline:$max_chars}" ]; then
  headline=${headline:0:$(($max_chars - 3))}'...'
fi

echo ${index}. ${headline}
clean_exit
