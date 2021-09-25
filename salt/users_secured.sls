create-users:
  user.present:
    - name: vk
    - fullname: Vijay Gupta
    - shell: /bin/bash
    - home: /home/vk
    - groups:
      - sudo
    - remove_groups: False
    - password: {{ pillar['users']['vk']['password_hash'] }}

create-ssh-directory:
  file.directory:
    - name: '/home/vk/.ssh'
    - user: vk
    - group: vk
    - dir_mode: 0700

setup-ssh-keys:
  file.managed:
    - name: '/home/vk/.ssh/authorized_keys'
    - user: vk
    - group: vk
    - mode: 0600
    - contents: {{ pillar['users']['vk']['ssh_public_key'] }}
