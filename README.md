# Linux routing lab (static and NAT routing)

Task - create docker containers which can route traffic. 3 docker network and router container connecting networks as per diagramm:
![Network diagramm](/out/net-scheme/Routing%20Lab%20(static%20+%20NAT).png)


## How to run

1. Create container image with networked_image/Dockerfile (it has to be named 'networked-ubuntu-07' as docker compose will require such image)
1. 'compose up' network_compose/compose.yaml from the network_compose directory (.yaml file uses relative paths to init scripts to be placed to corresponding containers)
1. Check connectivity by connecting to each container.


## Caveates
* As per explanation https://github.com/bitmeal/docker-nat-router-container-example

***Building a NAT router in docker is only possible from macvlan networks, as otherwise all IP traffic is handled directly by the host, outside the realm of influence of a container!***

***A macvlan network without parent interface. Containers in this network can communicate with each other but not reach targets outside the network by default. A virtual interface is automatically created as parent by docker. A custom subnet and gateway address may be specified from the compose file; if not, docker will assign a random subnet and the first usable (non-broadcast) address on the subnet as gateway to containers on the network.***

* On windows (and probably Linux) system firewall should be 

* At the moment [router setup script](/network_compose/router_init.sh) uses mix of iproute2 and iptables route creation. It seems impossible to do NAT routing with iproute2 (or lack of information in internet).

## Further development
* Move all route creation to iptables. Leave iproutes2 package in container for command line use only.
* Create better (than command line output) display of ping results from deep_containers. E.g. some sort of web server in separate container which will gather and display information on pings from all 3 containers (e.g. IRC server on router instance)
 
## Used software
* [PlantUML](https://github.com/plantuml/plantuml) for documentation of network structure (image above)
* [iproute2](http://www.policyrouting.org/iproute2.doc.html)
* [iptraf](http://iptraf.seul.org/) console network monitor
