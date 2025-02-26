#!/bin/sh
# ping 1.1.1.1
trap "exit" TERM; 

echo router - Deleting old 'preconfigured' routes
ip route del default
ip route del 192.168.0.0/27
ip route del 192.168.0.32/27
ip route del 192.168.0.64/27

echo router - Setting up new routes
ip route add 192.168.0.0/27  dev eth0
ip route add 192.168.0.32/27 dev eth1
ip route add 192.168.0.64/27 dev eth2
ip route add default via 192.168.0.1

echo setting NAT rules
# IPTables syntax: https://www.ellipsix.net/geninfo/firewall/iptables/reference.html
iptables --table nat --append POSTROUTING  --src 192.168.0.32/27  --out-interface eth0 -j MASQUERADE
iptables --append FORWARD --in-interface eth1 -j ACCEPT

iptables --flush

while true; do 
    echo "Hello from router container"
    ping -c 1 8.8.8.8
    sleep 5
done