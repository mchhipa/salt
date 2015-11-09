{% if grains['server_type'] == 'app' %}
{% set user_list = 'app_user_list' %}
{% elif grains['server_type'] == 'db' %}
{% set user_list = 'db_user_list' %}
{% endif %}

{% for user, details in pillar[user_list].iteritems() %}
{{ user }}:
  user.present:
    - home: /home/{{ user }}
    - uid: {{ details['uid'] }}
    - password: {{ details['passwd'] }}
    - shell: /bin/bash
{% endfor %}
