ntp_package:
  pkg.installed:
    - name: ntp

ntp_conf_file:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/files/ntp.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: ntp_package

ntp_service:
  service:
    - name: ntpd
    - running
    - enable: True
    - require:
      - file: ntp_conf_file
    - watch:
      - file: ntp_conf_file 
