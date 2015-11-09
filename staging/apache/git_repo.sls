git:
  pkg.intalled
  user.present:
     - home: /home/git

/opt/apache-repo:
  file.directory:
    - user: git
    - group: git
    - dir_mode: 0755
    - require:
      - user: git
/home/git/.ssh:
  file.directory:
    - user: git
    - group: git
    - dir_mode: 775
    - require:
      - user: git

git-key:
  file.managed:
    - name: /home/git/.ssh/id_rsa
    - source: salt://apache/keys/id_rsa
    - user: git
    - group: git
    - mode: 400
    - require:
      - file: /home/git/.ssh

github.com:
  ssh_known_hosts:
    - present
    - user: git
    - fingerprint: ac:23:34:10:83:24:79:3b:61:26:e9:bf:4e:f0:78:fa
    - require:
      - user: git

git-repo:
  git.latest:
    - name: git@github.com:GITHUBUSER/apache-repo.git
    - rev: master
    - user: git
    - target: /opt/apache-repo
    - require:
        - pkg: git
        - file: /opt/apache-repo
        - ssh_known_hosts: github.com
