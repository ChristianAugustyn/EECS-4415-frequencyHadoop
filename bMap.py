#! /usr/bin/python

import sys
import re

for line in sys.stdin:
    line = line.strip()
    word, doc = line.split(',', 1)
    print('%s\t%s' % (word, 1))
