/etc/apache2/apache2.conf:
  file.managed:
    - source: salt://webserver/apache2.conf

apache:
  pkg.installed: 
    - pkgs:
      - apache2
  service.running:
    - enable: True
    - name: apache2
    - watch: 
      - file: /etc/apache2/apache2.conf

/var/www/index.html:                        # ID declaration
  file:                                     # state declaration
    - managed                               # function
    - name: /var/www/html/index.html
    - source: salt://webserver/files/index.html   # function arg
    - require:
      - apache

{# /etc/httpd/extra/httpd-vhosts.conf:
  file.managed:
    - source: salt://webserver/httpd-vhosts.conf

apache:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/httpd/extra/httpd-vhosts.conf
    - require:
      - pkg: apache #}
