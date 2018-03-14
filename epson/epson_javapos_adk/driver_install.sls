epson-adk-env:
   environ.setenv:
     - name: epson-env-dict
     - value:
         PCS_INSTALL_DIR: /opt/epson_pcs/portcommunicationservice
         PCS_SETTING_DIR: /var/epson_pcs
         EPSON_JPOS_INSTALL: /opt/EpsonJavaPOS
         Java_HOME: /opt/jdk1.8.0_144
         LD_LIBRARY_PATH: /opt/EpsonJavaPOS:/opt/EpsonJavaPOS/lib:/opt/EpsonJavaPOS/bin:$LD_LIBRARY_PATH

extract-epson-adk-driver:
  archive.extracted:
    - name: /tmp/
    - source: salt://{{ slspath }}/files/Epson_JavaPOS_ADK_1141_for_Linux.tar.gz
    - user: root
    - group: root

install-epson-adk-driver:
  cmd.run:
    - name: 'cd /tmp/Epson_JavaPOS_ADK_1141_for_Linux && sh JavaPOSInstall.sh'
    - cwd: '/tmp/Epson_JavaPOS_ADK_1141_for_Linux'
    - unless: 'ls /opt/EpsonJavaPOS'
