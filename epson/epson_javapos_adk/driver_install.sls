epson-environment:
   file.managed:
     - name: /etc/profile.d/epson.sh
     - source: salt://{{ slspath }}/files/environment.sh

extract-epson-adk-driver:
  archive.extracted:
    - name: /tmp/
    - source: salt://{{ slspath }}/files/Epson_JavaPOS_ADK_1141_for_Linux.tar.gz
    - user: root
    - group: root

install-epson-adk-driver:
  cmd.run:
    - name: 'env && bash JavaPOSInstall.sh'
    - cwd: '/tmp/Epson_JavaPOS_ADK_1141_for_Linux'
    - env:
      - JAVA_HOME: /opt/jdk1.8.0_144
    - unless: 'ls /opt/EpsonJavaPOS'
