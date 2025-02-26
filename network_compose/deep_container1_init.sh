#!/bin/sh
# ping 1.1.1.1
trap "exit" TERM; 

echo deep_container1 - Deleting old 'preconfigured' routes
ip route del default
ip route del 192.168.0.32/27


echo deep_container1 Setting up new routes
ip route add 192.168.0.32/27 dev eth0
# Internet connection
ip route add default via 192.168.0.40 dev eth0

while true; do 
    echo "Hello from deep_container1"
    ping -c 1 1.1.1.1
    sleep 3
done