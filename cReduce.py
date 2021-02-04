#! /usr/bin/python

import sys

comma = ','
tab = '\t'

idf = 0
key = None

for line in sys.stdin:
    line = line.strip()

    if comma in line: #if there is a ',' then you know its a word count
        word, tail = line.split(comma, 1)
        doc, value = tail.split(tab, 1)
        value = int(value)
        tf_idf = value * idf
        print('%s,%s\t%s' % (word, doc, tf_idf))

    else:
        key, idf = line.split(tab, 1)
        idf = float(idf)
