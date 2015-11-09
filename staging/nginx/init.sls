nginx_package:
  pkg.installed:
    - name: nginx
nginx_service:
  service:
    - name: nginx
    - running
    - enable: True 
    - require:
      - pkg: nginx_package
