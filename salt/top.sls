base:
  '*':
    - common.init
  'location:RackA':
    - match: grain
    - timezones
    - webserver
  'location:RackB':
    - match: grain
    - timezones
    - users_secured
    
