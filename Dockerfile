from tomcat:latest
run cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
copy ./*.war /usr/local/tomcat/webapps
