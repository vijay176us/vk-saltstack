base:
  '*':
    - core # It has users pillar info as well
  'minion1':
    - ssh_key
  'minion2':
    - users_secured

webserver:
  'minion2*':
    - webserver_data
