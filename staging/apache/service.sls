{% if grains['lsb_distrib_id'] == "CentOS" %}
httpd:
{% elif grains['lsb_distrib_id'] == "Ubuntu" %}
apache2:
{% endif %}
  pkg: 
    - installed
  service:
    - running
    - enable: True
    - reload: True
