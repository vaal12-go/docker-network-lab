FROM ubuntu@sha256:3d1556a8a18cf5307b121e0a98e93f1ddf1f3f8e092f1fddfd941254785b95d7

LABEL version="0.3_05Jan2025"
LABEL description="This image is prepared for laboratory work  \
with network stack (routing)."

# Build image command: 
#   docker buildx build -t networked-ubuntu-07 .
# 
# Run image: 
#   docker run -it --rm --cap-add=NET_ADMIN networked-ubuntu-07 
#   docker run -it --rm --cap-add=NET_ADMIN --name qwe1 --hostname qwehost  networked-ubuntu-05
#
# Connect to running image:
#   docker exec -it router_instance sh

RUN apt update

RUN apt install software-properties-common -y
RUN apt install iputils-ping -y
RUN apt install iproute2 -y
RUN apt install traceroute -y
RUN apt install iptraf -y
# Needed for NAT setup
RUN apt install iptables -y


# TODO: check if IRC message can be sent from command line: https://serverfault.com/questions/183157/send-message-to-irc-channel-from-bash
# TODO check simple IRC server to be ran on router instance.
CMD bash



