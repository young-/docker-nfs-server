FROM debian:jessie

# runit 2.1.2.1-1 expect the following file to exist, if not it breaks build.
# Issue is not in wheezy
RUN touch /etc/inittab
RUN apt-get update && apt-get install -y nfs-kernel-server runit inotify-tools
RUN mkdir -p /exports

RUN mkdir -p /etc/service/nfs
ADD nfs.init /etc/service/nfs/run
ADD nfs.stop /etc/service/nfs/finish

ADD nfs_setup.sh /usr/local/bin/nfs_setup
ADD nfs-common /etc/default/nfs-common
ADD nfs-kernel-server /etc/default/nfs-kernel-server

VOLUME /exports

EXPOSE 111/udp 111/tcp 2049/tcp 2049/udp

ENTRYPOINT ["/usr/local/bin/nfs_setup"]
