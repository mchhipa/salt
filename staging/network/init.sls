eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 192.168.0.100
    - netmask: 255.255.255.0
    - dns:
      - 8.8.8.8

routes:
  network.routes:
    - name: eth2
    - routes:
      - name: dmz_network
        ipaddr: 192.168.0.0 
        netmask: 255.255.255.0
        gateway: 192.168.0.1
