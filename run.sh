#!/bin/bash
i=8
# while [ $i -le 8 ]
# do
GPU_FREQ="114750000 204000000 306000000 408000000 510000000 599250000 701250000 752250000 803250000 854250000 905250000 956250000 1007250000 1058250000 1109250000"
for freq in $GPU_FREQ
do
echo $freq > /sys/devices/17000000.gv11b/devfreq/17000000.gv11b/min_freq
echo $freq > /sys/devices/17000000.gv11b/devfreq/17000000.gv11b/max_freq
sleep 10
python3 benchmark.py --model_name inception_v4 --csv_file_path /home/wxk/jetson_benchmarks/benchmark_csv/nx-benchmarks.csv --model_dir /home/wxk/jetson_benchmarks/models/  >> ./results/${i}${freq}.txt
sleep 30
done
# let i++
# done