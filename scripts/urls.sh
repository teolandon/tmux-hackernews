#!/usr/bin/env bash

# get current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

index=`. $DIR/compute_index.sh`

index=$((index+30))

storylink=`sed "${index}q;d" $DIR/../headlines.conf`

echo $storylink
