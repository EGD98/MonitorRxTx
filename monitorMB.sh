#!/bin/bash
#EGD Xploid
while true;do
x=$(cat /sys/class/net/wlp5s0/statistics/rx_bytes)
xt=$(cat /sys/class/net/wlp5s0/statistics/tx_bytes)
sleep 1
y=$(cat /sys/class/net/wlp5s0/statistics/rx_bytes)
yt=$(cat /sys/class/net/wlp5s0/statistics/tx_bytes)
clear
rx=`expr $y - $x`
tx=`expr $yt - $xt`
#================== Download Rx data ==========#
if [ $rx -le 1024 ];then #-le menor igual
        if [ $tx -le 1000 ];then #-le menor igual
            echo " $rx B/s  $tx B/s"
        elif [ $tx -le 1000000 ];then
           Tx=$(echo "scale=3; $tx/1000" | bc)
            echo " $rx B/s  $Tx KB/s"
        else
            Tx=$(echo "scale=3; $tx/1048576" | bc)
            echo " $rx B/s   $Tx MB/s"
        fi
elif [ $rx -le 1048576 ];then
Rx=$(echo "scale=3; $rx/1024" | bc)
        if [ $tx -le 1000 ];then #-le menor igual
            echo " $Rx KB/s  $tx B/s"
        elif [ $tx -le 1000000 ];then
            Tx=$(echo "scale=3; $tx/1000" | bc)
            echo " $Rx KB/s  $Tx KB/s"
        else
            Tx=$(echo "scale=3; $tx/1048576" | bc)
            echo " $Rx KB/s   $Tx MB/s"
fi
else
Rx=$(echo "scale=3; $rx/1048576" | bc)
        if [ $tx -le 1000 ];then #-le menor igual
            echo " $Rx MB/s  $tx B/s"
        elif [ $tx -le 1000000 ];then
            Tx=$(echo "scale=3; $tx/1000" | bc)
            echo " $Rx MB/s  $Tx KB/s"
        else
            Tx=$(echo "scale=3; $tx/1048576" | bc)
            echo " $Rx MB/s    $Tx MB/s"
        fi
fi
#==================== Updown Tx data =============#
#if [ $tx -le 1000 ];then #-le menor igual
#echo " $tx B/s"
#elif [ $tx -le 1000000 ];then
#Tx=$(echo "scale=3; $tx/1000" | bc)
#echo " $Tx KB/s"
#else
#Tx=$(echo "scale=3; $tx/1048576" | bc)
#echo "  $Tx MB/s"
#fi
done
