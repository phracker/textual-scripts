#!/usr/bin/env python

import sys
import hashlib

if __name__ == '__main__':
    if sys.argv[2] != '':
        try:
            print(hashlib.new(sys.argv[2], ' '.join(sys.argv[3:])).hexdigest())
        except ValueError:
            print('{}: Unknown algorithm'.format(sys.argv[2]))
    else:
        print('/debug Usage: /hash <algorithm> <data>')
        if hasattr(hashlib, 'algorithms_available'):
            algorithms = hashlib.algorithms_available
        else:
            algorithms = ('md5', 'sha1', 'sha224', 'sha256', 'sha384', 'sha512')
        print('/debug Algorithms: ' + ', '.join(algorithms))

