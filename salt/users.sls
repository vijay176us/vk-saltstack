{% for oneuser in pillar['user-list'] %}
{{ oneuser.name }}:
  user.present:
    - password: {{ oneuser.pass }}
    - home: /home/{{ oneuser.name }}
    - shell: {{ oneuser['shell'], '/bin/bash' }}
{% endfor %}
