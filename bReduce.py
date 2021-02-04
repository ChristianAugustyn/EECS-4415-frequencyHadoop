#! /usr/bin/python

import sys
import re
import math

currKey = None
currCount = 0
key = None
number_of_files = 20

for line in sys.stdin:
    line = line.strip()
    key, count = line.split('\t', 1)

    try:
        count = int(count)
    except ValueError:
        continue

    if key == currKey:
        currCount += 1

    else:
        if currKey:

            print('%s\t%s' % (currKey, math.log(number_of_files / currCount)))
        
        currKey = key
        currCount = count

if currKey == key:
    print('%s\t%s' % (currKey, math.log(number_of_files / currCount)))
