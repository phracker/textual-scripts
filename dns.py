#!/usr/bin/env python

import sys
import socket

if __name__ == '__main__':
    if sys.argv[2] != '':
        result = socket.gethostbyname(sys.argv[2])
        print('{0}: {1}'.format(sys.argv[2], result))
    else:
        print('/debug Usage: /dns <Domain Name or IP Address>')
