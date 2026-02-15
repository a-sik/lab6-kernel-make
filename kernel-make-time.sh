#!/bin/bash

N=$( grep -c processor /proc/cpuinfo )
echo "threads | real time" > "./times_result.txt"
for i in $( seq 0 $((2*N+1)) ); do
    make clean > /dev/null 2>&1
    make defconfig > /dev/null 2>&1
    echo "Start \'make -j$i\'"
    real_time=$({ time make -j$i > /dev/null 2>&1; } | grep real | awk '{print $2}') 
    echo " $i | $real_time" >> "./times_result.txt"
done