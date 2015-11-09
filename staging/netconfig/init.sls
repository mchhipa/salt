{% if grains['fqdn'].startswith('stgdc1app01') %}
{% set netmask = '255.255.255.0' %}
{% elif grains['fqdn'].startswith('stgdc1app02') %}
{% set netmask = '255.255.0.0' %}
{% endif %}

network_file:
  file.managed:
    - name: /etc/sysconfig/network-scripts/ifcfg-eth0
    - source: salt://netconfig/files/ifcfg-eth0
    - mode: 644
    - template: jinja
    - context:
      ipaddr: {{ grains['ip_interfaces']['eth0'][0] }}
      netmask: {{ netmask }}
      hwaddr: {{ grains['hwaddr_interfaces']['eth0'].upper()}}
