# FROM debian:bullseye-slim
FROM ubuntu:22.04

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive 

VOLUME ["/var/cache/apt-cacher-ng"]

RUN apt-get update && \
    bash -c 'yes | apt-get install -y apt-transport-https apt-cacher-ng' && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3142

CMD chmod 777 /var/cache/apt-cacher-ng && \
    /etc/init.d/apt-cacher-ng start && \
    # echo "PassThroughPattern: .*" >> /etc/apt-cacher-ng/acng.conf && \
    # Output all logs of apt-cacher-ng
    tail -f /var/log/apt-cacher-ng/*

