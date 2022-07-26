#!/bin/bash
#Developed EGD Xploid monitor data internet
while true;do
x=$(cat /sys/class/net/wlp5s0/statistics/rx_bytes)
xt=$(cat /sys/class/net/wlp5s0/statistics/tx_bytes)
sleep 1
y=$(cat /sys/class/net/wlp5s0/statistics/rx_bytes)
yt=$(cat /sys/class/net/wlp5s0/statistics/tx_bytes)
clear
rx=`expr $y - $x`
tx=`expr $yt - $xt`
#===================== Download Rx data ==========#
if [ $rx -le 124 ];then #-le menor igual
RXb=$(echo "scale=2; $rx*8" | bc)
        if [ $tx -le 124 ];then #-le menor igual
            TXb=$(echo "scale=2; $tx*8" | bc)
            echo " $RXb bit/s   $TXb bit/s"
        elif [ $tx -le 124999 ];then
            Tx=$(echo "scale=3; $tx/1000" | bc)
            TXb=$(echo "scale=3; $Tx*8" | bc)
            echo " $RXb bit/s  $TXb Kbit/s"
        elif [ $tx -ge 125000 ];then
            Txs=$(echo "scale=3; $tx/1000000" | bc)
            TXb=$(echo "scale=3; $Txs*8" | bc)
            echo " $RXb bit/s  $TXb Mbit/s"
        fi
elif [ $rx -le 124999 ];then
Rx=$(echo "scale=3; $rx/1000" | bc)
RXb=$(echo "scale=3; $Rx*8" | bc)
        if [ $tx -le 124 ];then #-le menor igual
            TXb=$(echo "scale=2; $tx*8" | bc)
            echo " $RXb Kbit/s  $TXb bit/s"
        elif [ $tx -le 124999 ];then
            Tx=$(echo "scale=3; $tx/1000" | bc)
            TXb=$(echo "scale=3; $Tx*8" | bc)
            echo " $RXb Kbit/s  $TXb Kbit/s"
        elif [ $tx -ge 125000 ];then
            Txs=$(echo "scale=3; $tx/1000000" | bc)
            TXb=$(echo "scale=3; $Txs*8" | bc)
            echo " $RXb Kbit/s  $TXb Mbit/s"
        fi     
elif [ $rx -ge 125000 ];then
Rxs=$(echo "scale=3; $rx/1000000" | bc)
RXb=$(echo "scale=3; $Rxs*8" | bc)

        if [ $tx -le 124 ];then #-le menor igual
            TXb=$(echo "scale=2; $tx*8" | bc)
            echo " $RXb Mbit/s  $TXb bit/s"
        elif [ $tx -le 124999 ];then
            Tx=$(echo "scale=3; $tx/1000" | bc)
            TXb=$(echo "scale=3; $Tx*8" | bc)
            echo " $RXb Mbit/s  $TXb Kbit/s"
        elif [ $tx -ge 125000 ];then
            Txs=$(echo "scale=3; $tx/1000000" | bc)
            TXb=$(echo "scale=3; $Txs*8" | bc)
            echo " $RXb Mbit/s  $TXb Mbit/s"
        fi
fi
#==================== Updown Tx data =============#
#if [ $tx -le 124 ];then #-le menor igual
#TXb=$(echo "scale=2; $tx*8" | bc)
#echo " $TXb bit/s"
#elif [ $tx -le 124999 ];then
#Tx=$(echo "scale=3; $tx/1000" | bc)
#TXb=$(echo "scale=3; $Tx*8" | bc)
#echo " $TXb Kbit/s"
#elif [ $tx -ge 125000 ];then
#Txs=$(echo "scale=3; $tx/1000000" | bc)
#TXb=$(echo "scale=3; $Txs*8" | bc)
#echo " $TXb Mbit/s"
#fi
done
