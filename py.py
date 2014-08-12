#!/usr/bin/env python
import sys
args = sys.argv
if(args[2] == ''):
  print "/debug Usage: /py <python expression>"
  sys.exit()
print(eval(' '.join(args[2:])))