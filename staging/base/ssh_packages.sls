{% if grains['lsb_distrib_id'] == 'CentOS' %}
openssh-clients:
{% elif grains['lsb_distrib_id'] == 'Ubuntu' %}
openssh-client:
{% endif %}
  pkg.installed
