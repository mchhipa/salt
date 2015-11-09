{% if data['id'] == 'stg*' %}
state_run:
  local.state.sls:
    - tgt: stgdc1app01
    - arg:
      - cron
    - kwarg:
        saltenv:
          staging
{% endif %}
