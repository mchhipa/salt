salt-repo:
  pkgrepo.managed:
    {% if grains['lsb_distrib_id'] == "CentOS" %}
    - humanname: CentOS-$releasever - Epel Repo
    - mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
    - comments: 
        - "#baseurl=http://download.fedoraproject.org/pub/epel/6/$basearch"
    - gpgcheck: 1
    - gpgkey: file://etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
    {% elif grains['lsb_distrib_id'] == "Ubuntu" %}
    - humanname: Ubuntu Salt Repo
    - name: "deb http://ppa.launchpad.net/saltstack/salt/ubuntu {{grains['oscodename'] }} main"
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/saltstack-{{ grains['oscodename'] }}.list
    - keyid: 0E27C0A6
    - keyserver: keyserver.ubuntu.com
    {% endif %}
