include:
  - lvm
backup_volume:
  blockdev.formatted:
      - name: /dev/backup_vg/backup_lv
      - fs_type: ext4
      - require:
        - lvm: backup_lv
