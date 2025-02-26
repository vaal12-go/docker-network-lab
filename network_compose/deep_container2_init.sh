#!/bin/sh
# ping 1.1.1.1
trap "exit" TERM; 

echo deep_container2 - Deleting old 'preconfigured' routes
ip route del default
ip route del 192.168.0.64/27

echo deep_container2 Setting up new routes

# TODO Check if this is needed at all (as this container will only access 192.168.0.32/27 network)
ip route add 192.168.0.64/27 dev eth0
ip route add default via 192.168.0.70 dev eth0

while true; do 
    echo "Hello from deep_container2"
    # ping -c 1 1.1.1.1
    sleep 3
done