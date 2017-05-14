#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

offset=`grep hacknews_offset $DIR/../vars.conf | sed "s/.*=//g"`

  sed -i "s/hacknews_offset=${offset}/hacknews_offset=$(((offset+1)%30))/gi" $DIR/../vars.conf
