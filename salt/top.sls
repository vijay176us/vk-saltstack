base:
  '*':
    - common.init
  'location:RackA':
    - match: grain
    - timezones
  'location:RackB':
    - match: grain
    - timezones
    - users_secured
    
