#!/usr/bin/env bash
# Usage: rb <expr>
# Print arbitrary Ruby expression <expr>.
if [[ $2 = '' ]]; then
  echo "/debug Usage: /rb <ruby expression>"
  exit
fi
ruby -e "p($(echo $* | sed s/^\#.*\ //))"