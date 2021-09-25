include:
  - base: webserver.env

/etc/apache2/apache2.conf:
  file.managed:
    - source: salt://webserver/apache2.conf


apache:
  pkg.installed: 
#    - pkgs:
#      - apache2
    {% if grains['os'] == 'RedHat' %}
    - name: httpd
    {% elif grains['os'] == 'Ubuntu' %}
    - name: apache2
    {% endif %}

apache_service:  
  service.running:
{% if grains['os_family'] == 'Debian' %}
    - name: apache2
{% elif grains['os_family'] == 'RedHat' %}
    - name: httpd
{% endif %}
    - enable: True
    - watch: 
      - file: /etc/apache2/apache2.conf 

/var/www/index.html:                        # ID declaration
  file:                                     # state declaration
    - managed                               # function
    - name: /var/www/html/index.html
    - source: salt://webserver/files/index.html   # function arg
    - require:
      - apache

