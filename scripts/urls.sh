#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

index=`. $DIR/compute_index.sh`

storylink=`curl -s https://news.ycombinator.com | grep "<a.*class=\"storylink\"" | sed -e "s/.*<td class=\"title\"><a href=\"//g" -e "s/\" class=\"storylink\">.*//g" -e "${index}q;d"`

echo $storylink
