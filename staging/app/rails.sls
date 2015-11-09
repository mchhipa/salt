install_rvm_key:
  cmd.run:
   - name: "gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3"
   - shell: /bin/bash
   - unless: "stat /root/.gnupg/trustdb.gpg || gpg2 --list-keys D39DC0E3"

update_apt:
  cmd.run:
   - name: "sudo apt-get update"

install_curl:
  pkg.installed:
     - name: curl

install_rvm:
  cmd.run:
    - name: "curl -sSL https://get.rvm.io | bash -s stable"

ruby-2.1.5:
  rvm.installed:
    - default: True
    - require:
      - pkg: rvm

set_ruby:
  cmd.run:
    - name: 'source /etc/profile.d/rvm.sh; rvm use 2.1.5 --default'
    - shell: /bin/bash
    - stateful: False
    - require:
      - rvm: ruby-2.1.5
    - unless: 'rvm current | grep 2.1.5'

rails:
  gem.installed:
    - require:
      - rvm: ruby-2.1.5
