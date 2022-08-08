FROM debian:bullseye-slim

VOLUME ["/var/cache/apt-cacher-ng"]
RUN apt-get update \
 && apt-get install -y apt-cacher-ng \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 3142
CMD chmod 777 /var/cache/apt-cacher-ng && \
    echo "PassThroughPattern: .*" >> /etc/apt-cacher-ng/acng.conf && \
    # Start the service
    /etc/init.d/apt-cacher-ng start && \
    # Output all logs of apt-cacher-ng
    tail -f /var/log/apt-cacher-ng/*

