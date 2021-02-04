export mapreduce_map_input_file=AliceInWonderland-1865.txt 
cat AliceInWonderland-1865.txt| python aMap.py > out.txt
export mapreduce_map_input_file=ATaleOfTwoCities-1859.txt 
cat ATaleOfTwoCities-1859.txt | python aMap.py >> out.txt
cat out.txt | sort -k1,1 | python aReduce.py > mr1.txt
cat mr1.txt | python bMap.py | sort -k1,1 | python bReduce.py > mr2.txt

cat mr1.txt > last.txt
cat mr2.txt >> last.txt
cat last.txt | python cMap.py | sort -k1,1 -k2,2 > check.txt 
cat check.txt | python cReduce.py > exit.txt 
