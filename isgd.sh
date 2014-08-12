#!/usr/bin/env bash
if [[ $# != 2 ]]; then
  echo "/debug Usage: /isgd <url>"
  exit
fi
curl "http://is.gd/api.php?longurl=$2"