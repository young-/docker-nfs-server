FROM debian:jessie
RUN apt-get update -qq && apt-get install -y nfs-kernel-server runit inotify-tools -qq
RUN mkdir -p /exports

RUN mkdir -p /etc/sv/nfs
ADD nfs.init /etc/sv/nfs/run
ADD nfs.stop /etc/sv/nfs/finish

ADD nfs_setup.sh /usr/local/bin/nfs_setup
ADD nfs-common /etc/default/nfs-common
ADD nfs-kernel-server /etc/default/nfs-kernel-server

VOLUME /exports

EXPOSE 111/udp 111/tcp 2049/tcp 2049/udp

ENTRYPOINT ["/usr/local/bin/nfs_setup"]
