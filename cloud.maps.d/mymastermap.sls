ubuntu:
  - mynewmaster:
      make_master: True
      minion:
        local_master: True
        log_level: debug
      grains:
        cluster: mynewcluster
  - newminion1:
      minion:
        local_master: True
        log_level: info
      grains:
        cluster: mynewcluster
        foo: bar
centos:
  - newminion2:
      minion:
        local_master: True
        log_level: warning
      grains:
        cluster: mynewcluster
        anothergrain: cool
