#!/bin/bash

WCDIR=/home/frequencyHadoop
STREAMINGJAR=share/hadoop/tools/lib/hadoop-streaming-2.7.0.jar

printf "A MAP-REDUCE\n\n"
bin/hadoop jar $STREAMINGJAR \
    -D mapred.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
    -D stream.num.map.output.key.fields=2               \
    -D mapred.text.key.comparator.options="-k1,1 -k2,2" \
    -D mapred.text.key.partitioner.options="-k1,1"      \
    -files $WCDIR/aMap.py,$WCDIR/aReduce.py \
    -mapper $WCDIR/aMap.py \
    -reducer $WCDIR/aReduce.py \
    -input Gutenberg/'*' \
    -output TF_values

printf "\n B MAP-REDUCE\n\n"
bin/hadoop jar $STREAMINGJAR \
    -D mapred.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
    -D stream.num.map.output.key.fields=2               \
    -D mapred.text.key.comparator.options="-k1,1 -k2,2" \
    -D mapred.text.key.partitioner.options="-k1,1"      \
    -files $WCDIR/bMap.py,$WCDIR/bReduce.py \
    -mapper $WCDIR/bMap.py \
    -reducer $WCDIR/bReduce.py \
    -input TF_values/'*' \
    -output IDF_values

printf "\n C MAP-REDUCE\n\n"
bin/hadoop jar $STREAMINGJAR \
    -D mapred.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
    -D stream.num.map.output.key.fields=2               \
    -D mapred.text.key.comparator.options="-k1,1 -k2,2" \
    -D mapred.text.key.partitioner.options="-k1,1"      \
    -files $WCDIR/cMap.py,$WCDIR/cReduce.py \
    -mapper $WCDIR/cMap.py \
    -reducer $WCDIR/cReduce.py \
    -input TF_values/'*',IDF_values/'*' \
    -output FinalMR
