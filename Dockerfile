from tomcat:latest
run cp /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
copy */*.war /usr/local/tomcat/webapps
