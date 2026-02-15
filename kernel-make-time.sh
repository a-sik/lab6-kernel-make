#!/bin/bash

N=$(grep -c processor /proc/cpuinfo)
echo "threads | real time" > "./times_result.txt"
for i in $( seq 0 $((2*N+1)) ); do
    make clean 
    make defconfig 
    echo "Start \'make -j$i\'"
    real_time=$({ time make -j$i; } | grep real | awk '{print $2}') 
    echo " $i | $real_time" >> "./times_result.txt"
done