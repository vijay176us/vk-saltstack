{% set dev_editor = salt['config.get']('dev_editor', 'vim') %}
{% set dev_type = salt['config.get']('dev_type', 'web') %}
include: 
  - git 
{% if dev_editor == 'vim' %} 
  - vim 
{% elif dev_editor == 'emacs' %} 
  - emacs 
{% endif %} 
  - ack 
  - pip 
  - pycharm 
 
extend: 
  vim_tools: 
    pkg: 
      - names: 
        - dev_vim_themes 
{% if dev_type == 'web' %} 
        - web_vim_syntaxes 
{% elif dev_type == 'qa' %} 
        - qa_vim_syntaxes 
{% endif %} 
