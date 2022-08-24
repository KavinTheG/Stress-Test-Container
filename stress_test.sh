#!/bin/bash

#NOTE: a process takes up memory of 256 MB

# Store number of cpu cores into a variable
# /proc/cpuinfo holds information on the cpu
# wc -l counts number of lines thato outputted, which will give the # of procesors
num_cpu=$(grep processor /proc/cpuinfo | wc -l)

mem_kb=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
mem_gb=$(bc <<<"$mem_kb * 0.000001")

mem_free_kb=$(grep MemFree /proc/meminfo  | awk '{print $2}')
mem_free_gb=$(bc <<< "$mem_free_kb * 0.00001")

echo "CPU Processors: $num_cpu"
echo "Total Memory: $mem_gb"
echo "Free Memory: $mem_free_gb"

#Maximum number of processes to run if mem_free_gb divided by 256 MB
# 1 MB = 1000 KB, 256 MB = 256000 KB
max_proc=$(($mem_free_kb / 256000)) 

echo "Please enter number of cores to stress (Max: $num_cpu)"

read cores_to_stress

echo "Please enter number of process to run (Max:$max_proc)"

read mem_to_stress

echo "How long would you like to run this script for? (seconds)"

read run_time

stress -c $cores_to_stress -m $mem_to_stress -t $run_time
