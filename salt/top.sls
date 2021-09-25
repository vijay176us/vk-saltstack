base:
  '*':
    - common.init
    - myuser.user
    - myuser.dotfiles
  'location:RackA':
    - match: grain
    - timezones
    - webserver
  'location:RackB':
    - match: grain
    - timezones
    - users_secured
