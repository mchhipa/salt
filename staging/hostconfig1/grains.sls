location:
  grains.present:
    {% if grains['fqdn'][3:6] == "dc1" %}
    - value: dc1
    {% elif grains['fqdn'][3:6] == "dcd" %}
    - value: dcd
    {% endif %}

server_type:
  grains.present:
    {% if grains['fqdn'][6:9] == "app" %}
    - value: app
    {% elif grains['fqdn'][6:9] == "dbs" %}
    - value: db
    {% endif %}
