apache:
  pkg.installed: [apache2]
  service.running:
    - require:
      - pkg: apache2

/var/www/index.html:                        # ID declaration
  file:                                     # state declaration
    - managed                               # function
    - source: salt://webserver/files/index.html   # function arg
    - require:                              # requisite declaration
      - pkg: apache2                       # requisite reference

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
