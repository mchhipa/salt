hosts_file:
  file.managed:
    - name: /etc/hosts
    - source: salt://hostconfig/files/hosts
    - user: root
    - hroup: root
    - mode: 644
    - template: jinja
    - context:
      local_ip_address: {{ grains['ip4_interfaces']['eth0'][0] }}
      local_host_name: {{ grains['fqdn'] }}
