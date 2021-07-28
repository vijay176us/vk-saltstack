{# This code loops through each user mentioned in 'user-list' pillar#}
{% for oneuser in pillar['user-list'] %}
{% if oneuser.name == 'user1' %}
  {{ oneuser.name }}:
    user.present:
      - password: {{ oneuser.pass }}
      - home: /home/{{ oneuser.name }}
      - shell: {{ oneuser['shell'], '/bin/bash' }} # This creates user's shell
#{% else %}

{% endif %}
{% endfor %}
