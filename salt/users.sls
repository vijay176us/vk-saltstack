{# This code loops through each user mentioned in 'user-list' pillar#}
{% for oneuser in pillar['user-list'] %}
{{ oneuser.name }}:
  user.present:
    - password: {{ oneuser.pass }}
    - home: /home/{{ oneuser.name }}
    - shell: {{ oneuser['shell'], '/bin/bash' }} # This creates user's shell
{% endfor %}
