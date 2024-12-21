FROM tomcat:9-jdk11-openjdk

# Copy your custom context.xml to allow remote management
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml

# Copy the contents of webapps.dist to webapps
COPY webapps.dist /usr/local/tomcat/webapps/

# Add custom tomcat-users.xml for setting manager/admin accounts
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Expose Tomcat ports
EXPOSE 8080
EXPOSE 8009

# Optionally set environment variables
ENV CATALINA_HOME=/usr/local/tomcat

# Copy .war file to webapps
copy ./*.war /usr/local/tomcat/webapps

# Start Tomcat
CMD ["catalina.sh", "run"]

