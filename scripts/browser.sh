#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

browser=`grep ^browser $DIR/../vars.conf | sed "s/.*=//g"`

echo $browser
