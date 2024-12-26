FROM tomcat:9-jdk11-openjdk

# Copy the contents of webapps.dist to webapps
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

# Copy your custom context.xml to allow remote management
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml

# Add custom tomcat-users.xml for setting manager/admin accounts
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Expose Tomcat ports
EXPOSE 8080
EXPOSE 8009

# Optionally set environment variables
ENV CATALINA_HOME=/usr/local/tomcat

# Start Tomcat
CMD ["catalina.sh", "run"]
