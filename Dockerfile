FROM telegraf:latest

RUN echo "deb http://ftp.pl.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update &&  apt-get install --yes snmp-mibs-downloader

RUN download-mibs && sed -i "s/^\(mibs *:\).*/#\1/" /etc/snmp/snmp.conf

COPY NAS.mib /usr/share/snmp/mibs
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]

