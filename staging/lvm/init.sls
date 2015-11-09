/dev/sdb:
  lvm.pv_present

/dev/sdc:
  lvm.pv_present

sleep_1:
  cmd:
    - run
    - name: sudo vgcreate backup_vg /dev/sdb /dev/sdc

backup_lv:
  lvm.lv_present:
    - vgname: backup_vg
    - size: 4G
