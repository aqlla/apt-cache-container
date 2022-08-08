# FROM debian:bullseye-slim
FROM ubuntu:22.04

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive 

VOLUME ["/var/cache/apt-cacher-ng"]

RUN apt-get update && \
    bash -c 'yes | apt-get install -y apt-transport-https apt-cacher-ng' && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3142

CMD /etc/init.d/apt-cacher-ng start && \
    # chmod 777 /var/cache/apt-cacher-ng && \
    # echo "PassThroughPattern: .*" >> /etc/apt-cacher-ng/acng.conf && \
    # Start the service
    # 
    # Output all logs of apt-cacher-ng
    tail -f /var/log/apt-cacher-ng/*

