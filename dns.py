#!/usr/bin/env python

import sys
import socket

if __name__ == '__main__':
    if sys.argv[2] != '':
        result = socket.gethostbyaddr(sys.argv[2])
        print('{0}: {1} ({2})'.format(sys.argv[2], result[0], result[2][0]))
    else:
        print('/debug Usage: /dns <Domain Name or IP Address>')
