#!/bin/bash
set -o errexit
/setup-confluence-db.sh
cat <<END > /opt/confluence-home/confluence.cfg.xml
<?xml version="1.0" encoding="UTF-8"?>
<confluence-configuration>
  <setupStep>complete</setupStep>
  <setupType>custom</setupType>
  <buildNumber>7901</buildNumber>
  <properties>
    <property name="access.mode">READ_WRITE</property>
    <property name="admin.ui.allow.daily.backup.custom.location">false</property>
    <property name="admin.ui.allow.manual.backup.download">false</property>
    <property name="admin.ui.allow.site.support.email">false</property>
    <property name="atlassian.license.message">AAABNg0ODAoPeNptUE1PwkAQve+v2MSLHpbQIlBINlHbxmBKwbaoBy/LOsAm7bbZDyL/ni2ViIbDJ JN58968Nzfv8IVfrMT+CHv+dDic3gc4jArs970JikBzJRojaknDWm5KC5IDvs1B7UHdfU5xvGelZ e0CChWcmogZoC2d9EfEHyNHNIyblFVAG9bY9Y6Zh23FRNnjdYW40+05XOyBGmWhG+SGKQOKblip4 SwRzx3pmsaviwuJRHCQGopDA6fb4WI+j7Nw9pigsoPeQOmW4yMnLA1I5tLF341Qh4sQ4zbEQm2ZF Lq7sSwyXADfybqstwI06v4xi+hTVoTkNX1OyCRdeWT14QUoj1PqiiTeIBj4/UGAfpy5/WQW/YVOz lNbrUEtNivtDFLinQnXrS2t4jum4f/fjwcrm8AwLAIUeNdCrbTXXyQ9i8+ygo/oHJp5LJECFG4FF njFnrCYbSgF0LjQF/eoUc9OX02ff</property>
    <property name="attachments.dir">${confluenceHome}/attachments</property>
    <property name="confluence.democontent.installed">true</property>
    <property name="confluence.setup.server.id">BEHE-G23Z-ZZP4-ER2C</property>
    <property name="confluence.webapp.context.path"></property>
    <property name="hibernate.c3p0.acquire_increment">1</property>
    <property name="hibernate.c3p0.idle_test_period">100</property>
    <property name="hibernate.c3p0.max_size">60</property>
    <property name="hibernate.c3p0.max_statements">0</property>
    <property name="hibernate.c3p0.min_size">0</property>
    <property name="hibernate.c3p0.timeout">60</property>
    <property name="hibernate.connection.driver_class">org.postgresql.Driver</property>
    <property name="hibernate.connection.isolation">2</property>
    <property name="hibernate.connection.password">${DB_PASSWORD}</property>
    <property name="hibernate.connection.url">${DB_JDBC_URL}/confluence</property>
    <property name="hibernate.connection.username">${DB_USER}</property>
    <property name="hibernate.database.lower_non_ascii_supported">false</property>
    <property name="hibernate.dialect">net.sf.hibernate.dialect.PostgreSQLDialect</property>
    <property name="hibernate.setup">true</property>
    <property name="lucene.index.dir">${localHome}/index</property>
    <property name="setup.hasSelectedBundle">true</property>
    <property name="setup.selectedBundlePluginKeys">{"com.atlassian.confluence.extra.team-calendars":{"key":"com.atlassian.confluence.extra.team-calendars","namespace":"team_calendars","name":"Team Calendars","description":"setup.selectbundle.team-calendars","license":"AAABMA0ODAoPeNp1kMtOwzAQRff+CktsYJEqcemDSpZAaRZITYtogQ0SGpxJa0icaOxU5O9x+hAog\r\noU3tu+5c+biBTOeQsvFkIdiFo5nI8Hj+YaLMJqyOVpFuna6MnKDUPIYCjQZkOV5RTyuTF40aBTyy\r\nzXSHunqdcaTPRQNdBm2bMp3pFX+ZJGsDCLmPORNnSEDNA6pJm1ROmqQxYSH4Bwcym6CIBwFYsh8k\r\nQPlllCizAg+0O4Is0zfbkvQxUBVZZ/sf+v9idp7WjsgXytzKCye0UnqQf+xf4yOwEIrNBafvVR3J\r\n5gPexMDfhPJV62p/SUwDoToj7A4AjZtjQeneJWmyWN8f7dgK9qC0fbYZluDXuTTsnWylP4EiyiaX\r\nE9vJiN2Yvzd99CQ2oHF/iK/AUtGqiUwLQIVAIAXvPbog8JawBq+LVQjH9MunkL5AhQHexlB591u9\r\ntmrSW8lPEVhOCWKjA==X02fb\r\n","remoteUrl":"https://marketplace.atlassian.com/download/plugins/com.atlassian.confluence.extra.team-calendars","localUrl":"file:/opt/confluence/confluence/WEB-INF/others/team-calendars-5.2.13.obr","logo":"tc-logo.png","label":"license.tc.key","generateLicenseLink":"license.tc.generate.link"},"com.atlassian.confluence.plugins.confluence-questions":{"key":"com.atlassian.confluence.plugins.confluence-questions","namespace":"com.atlassian.confluence.plugins.confluence-questions","name":"Confluence Questions","description":"setup.selectbundle.confluence-questions","license":"AAABQQ0ODAoPeNqtkstOwzAQRff+CktsYJEocXmUSpFAaRZITQu0wIbNkExaQ+KEGacif4/Th6iQ2\r\nFQsRrJm7HuPr33ygrlMoZNqIAM1Cq5GAyXj8UKqIByKMXJGurG6NtFDi9wvWBY1ybg2RdmiyVCez\r\npHWSGevI5msoWyh3yWmbfWGNCueGIkjLxQx4WYyBotRr+4FF54aCKdkIbNTqDDKCd6RV4R5rm+WF\r\nejSz+pKuPLBlsCswbjO3tpvynapDR+0vM89pu9E9RojSy0eqTC3QBYpKqBk3IMmqcP6i/QngK1vq\r\nTM0jM8ug76nhDtsLBpwRslXo6k7iOPSU+pI0snWZ9E1uAkynqVp8hjf3U7EjJZgNG+huDPoYvlgM\r\nU+mkStvEoZX58PrYSB2Gv+Jhe6u1JDm3TPct5StgPH3H/gGosjmPzAsAhR2c8CJ5t0MenjRY7IZ+\r\nT8fCnWeJQIUArvNyzIpW5ptaJVmRsd91oqJK5E=X02g0\r\n ","remoteUrl":"https://marketplace.atlassian.com/download/plugins/com.atlassian.confluence.plugins.confluence-questions","localUrl":"file:/opt/confluence/confluence/WEB-INF/others/confluence-questions-2.1.1.obr","logo":"cq-logo.png","label":"license.cq.key","generateLicenseLink":"license.cq.generate.link"}}</property>
    <property name="webwork.multipart.saveDir">${localHome}/temp</property>
    <property name="jwt.private.key">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</property>
    <property name="jwt.public.key">MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAgY8hRifG8fWRW6sJzSPqpxHfvsPPCAuGwNNYIiXvxDO8Fmtxsf9B4m4GF8Q+Bcnl6LHKqJlId7lgUSqJycTncZZ7qERgjVCVucclSNIq9MFJCCwpdaLNCNT21Hzb8tX25ESSGcP7KXtHECZtHQ/e4U+Is8tLSe+6ZH2fVqiAwVvOEf6SxnmBTP6eBtLkQ+WXOZOPH2K1JqqL+YEKad07ETRLcGwhsXeJaN7SacJ8k8qTYw2R3UnKyyzFKMK58URR6IVnq8NZ3lJidiX+YaJhP6aBoaGwW6HV5sUYK8L0aNUwzA6kisQe59XyB/fYV+GxglmokgR9o4s6U7Tem2YiGhekBaHF6duYGeqjU2RZvxVqb4p5VS7eJyPLjhjgWo43ZSWJ1VWLRK12o9OmXKdYp9o9rLXzmzVLgn2S1HFBb5o/PXsoUh32YI5yMTwXQbsUorVoYWZAwSlrFgj+bixw8CuVvPM2gjVhJwvvnJzcb2QR5EasI6bs4Fh1Y1MZZkh9AgMBAAE=</property>
  </properties>
</confluence-configuration>
END
/opt/confluence/bin/catalina.sh run
