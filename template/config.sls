# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from tpldir ~ "/map.jinja" import template with context %}
{%- from tpldir ~ "/macros.jinja" import files_switch with context %}

include:
  - template.install

template-config:
  file.managed:
    - name: {{ template.config }}
    - source: {{ files_switch(
                    salt['config.get'](
                        tpldir ~ ':tofs:files:template-config',
                        ['example.tmpl', 'example.tmpl.jinja']
                    )
              ) }}
    - mode: 644
    - user: root
    - group: root
    - template: jinja
