# Telegraf image for scraping SNMP from QNAP devices

Building upon work in https://gitlab.com/artkrz/telegraf-qnap

Example configuration improved so that it can be sanely used with Grafana (eg. using device identifiers and names and tags, preferring integeres for values instead of strings etc).

## Running

```
docker run -d --name qnap-snmp-telegraf \
           -v /your_host_location/telegraf/telegraf.conf:/etc/telegraf/telegraf.conf \
           qnap-snmp-telegraf --config /etc/telegraf/telegraf.conf
```

# Worth noting

Based on `snmpwalk` it seems that Qnap doesn't publish eg. memory metrics (cache, buffers) so this config just uses the very basic free/total values from their own OIDs.

Didn't add SSD cache metrics as I don't use that feature