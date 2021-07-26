{% if 'us-east-1' in grains['Region'] %}
America/New_York:
  timezone.system:
    - utc: True

include:
  - common.init

{% elif 'us-west-1' in grains['Region'] %}
America/Los_Angeles:
  timezone.system:
    - utc: True

include:
  - common.init

{% else %}
Asia/Kolkata:
  timezone.system:
    - utc: True

{% endif %}


