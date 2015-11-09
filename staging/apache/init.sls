httpd_source:
  file.managed:
    - name: /opt/httpd-2.4.17.tar.gz
    - source: http://mirror.cc.columbia.edu/pub/software/apache//httpd/httpd-2.4.17.tar.gz
    - source_hash: http://www.apache.org/dist/httpd/httpd-2.4.17.tar.gz.md5

extract_httpd_source:
  archive.extracted:
    - name: /opt/
    - source: http://mirror.cc.columbia.edu/pub/software/apache//httpd/httpd-2.4.17.tar.gz
    - source_hash: http://www.apache.org/dist/httpd/httpd-2.4.17.tar.gz.md5
    - archive_format: tar
    - if_missing: /opt/httpd-2.4.17
    
/opt/apache:
  file.symlink:
    - target: httpd-2.4.17
    - require: 
      - archive: extract_httpd_source

/opt/apache_root:
  file.recurse:
    - source: salt://apache/files/apache_root
    - include_empty: True
    - dir_mode: 0755

/opt/apache_root/careers:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

/opt/apache_root/index.html:
  file.managed:
    - source: salt://apache/files/index.html
    - user: root
    - group: root
    - mode: 0644
