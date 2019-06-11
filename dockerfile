FROM ubuntu:18.04
RUN apt-get update -y && \
    apt-get install -y isc-dhcp-server tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
VOLUME ["/var/lib/dhcp", "/etc/dhcp"]
RUN touch /var/lib/dhcp/dhcpd.leases
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENTRYPOINT ["/usr/sbin/dhcpd", "-d", "--no-pid"]
