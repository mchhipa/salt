tomcat-server:
  archive.extracted:
    - name: /opt/
    - source: http://mirror.nus.edu.sg/apache/tomcat/tomcat-6/v6.0.43/bin/apache-tomcat-6.0.43.tar.gz
    - source_hash: md5=0abbb1852a608c8b4ccb7003c700337b
    - archive_format: tar
    - if_missing: /opt/apache-tomcat-6.0.43/ 
