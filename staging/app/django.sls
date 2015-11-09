python_packages:
  pkg.installed:
    - pkgs:
      - python
      - python-pip

django:
  pip.installed:
    - name: django >= 1.6
    - require:
      - pkg: python_packages
