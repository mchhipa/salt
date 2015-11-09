generic_group:
  group.present:
    {% if grains['server_type'] == 'app' %}
    - name: {{ pillar['groups']['stg_app_group'] }}
    {% elif grains['server_type'] == 'db' %}
    - name: {{ pillar['groups']['stg_db_group'] }}
    {% endif %}
