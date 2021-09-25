{% for user in pillar['users'] %}
add_{{ user }}:
  user.present:
    - name: {{ user }}
{% endfor %}

{% if not salt['file.directory_exists' ]('/root/.ssh') %}
/home/init_dir:
  file.directory:
    - name: /root/.ssh
{% else %}
  cmd.run:
    - name: echo "Directory exists"
{% endif %}

{% if 'my_ssh_key' in pillar %}
manage_my_ssh_key:
  file.managed:
    - name: /root/.ssh/{{ pillar['my_ssh_key_name'] }}
    - mode: 600
    - contents_pillar: my_ssh_key
    - show_diff: False
{% endif %}
