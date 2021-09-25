setting_env_variable:
   environ.setenv:
     - name: MYENVVAR
     - value: 'Hello VijayJI!'
     - update_minion: True


{% set myenvvar = salt['environ.get']('MYENVVAR') %}
{% if myenvvar %}

Create a file with contents from an environment variable:
  file.managed:
    - name: /tmp/hello
    - contents: {{ salt['environ.get']('MYENVVAR') }}
  cmd.run:
    - name: 'echo {{ myenvvar }}'

{% else %}

Fail - no environment passed in:
  test.fail_without_changes

{% endif %} 
