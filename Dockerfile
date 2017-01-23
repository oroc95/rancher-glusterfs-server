FROM ubuntu:14.04

MAINTAINER olivier rochon <orochon@free.fr>

RUN apt-get update && \
    sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile && \
    apt-get install -y python-software-properties software-properties-common
    
RUN add-apt-repository -y ppa:gluster/glusterfs-3.7 && \
    apt-get update && \
    apt-get install -y glusterfs-server supervisor


ADD ./bin /usr/local/bin
ADD ./etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV GLUSTER_VOL=ranchervol \
    GLUSTER_REPLICA=2 \
    GLUSTER_BRICK_PATH=/gluster_volume \
    GLUSTER_PEER=**ChangeMe** \
    DEBUG=0


VOLUME ["${GLUSTER_BRICK_PATH}"]
VOLUME /var/lib/glusterd

RUN mkdir -p /var/log/supervisor /var/run/gluster \
    chmod +x /usr/local/bin/*.sh

CMD ["/usr/local/bin/run.sh"]
