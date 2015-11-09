include:
  - disk.format

backup_mount:
  mount.mounted:
    - name: /backup
    - device: /dev/backup_vg/backup_lv
    - fstype: ext4
    - mkmnt: True
    - opts: defaults
    - persist: True
    - mount: True
    - dump: 0
    - pass_num: 0
    - require:
      - blockdev: backup_volume
