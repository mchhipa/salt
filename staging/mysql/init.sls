mysql-client:
  pkg.installed

mysql-server:
  pkg.installed
    
python-mysqldb:
  pkg.installed
  
mysql:
  service.running:
    - enable: True
    - require:
      - pkg: mysql-server


mysqll-wpdbuser:
  mysql_user.present:
    - connection_user: root
    - connection_pass:  '{{ pillar['mysql_root']['passwd'] }}'
    - name : wpdbuser
    - password_hash: '{{ pillar['mysql_root']['passwd_hash'] }}'
    - require:
      - service: mysql

wp:
  mysql_database.present:
    - connection_user: root
    - connection_pass:  '{{ pillar['mysql_root']['passwd'] }}'


wpdbuser-grant:
  mysql_grants.present:
    - connection_user: root
    - connection_pass:  '{{ pillar['mysql_root']['passwd'] }}'
    - grant: all privileges
    - database: wp.*
    - user: wpdbuser

mysql-root:
  mysql_user.present:
    - connection_user: root
    - connection_pass:  '{{ pillar['mysql_root']['passwd'] }}'
    - name: root
    - password_hash: '{{ pillar['mysql_root']['passwd_hash'] }}'
    - require:
      - service: mysql

