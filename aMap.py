#! /usr/bin/python

import sys
import re
import os

for line in sys.stdin:
    tokens = filter(None, re.split('[\W+_]', line.strip()))
    #gets the file name from the os environment variable
    file_name = os.environ['mapreduce_map_input_file']

    for token in tokens:
        word = re.sub('[^a-zA-Z0-9]+', '', token.lower())
        print ('%s,%s\t%s' % (word.lower(), file_name, 1))
