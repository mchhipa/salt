webserver_deploy:
  salt.state:
    - tgt: 'server_type:web'
    - tgt_type: grain
    - sls: nginx
    - require:
      - salt: dbserver_deploy

dbserver_deploy:
  salt.state:
    - tgt: 'server_type:db'
    - tgt_type: grain
    - sls: mysql

