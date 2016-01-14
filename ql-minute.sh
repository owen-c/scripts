#!/bin/zsh

HOUR=$1
SEARCH_STRING="^Operation"

echo "" > output.txt

for i in `seq 0 9`;
do
    echo "$HOUR:0$i" >> output.txt
    qlgrep "^EndTime.*$HOUR:0$i:" service_log*-0$1* | grep "$SEARCH_STRING" | sort | uniq -c >> output.txt
done

for i in `seq 10 59`;
do
    echo "$HOUR:$i" >> output.txt
    qlgrep "^EndTime.*$HOUR:$i:" service_log*-0$1* | grep "$SEARCH_STRING" | sort | uniq -c >> output.txt
done

