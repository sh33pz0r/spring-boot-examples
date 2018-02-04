# Pull base image
From tomcat:8-jre8

ARG WAR_FILE
# Copy to images tomcat path
ADD $WAR_FILE /usr/local/tomcat/webapps/
