# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "Fem Fem" 
COPY webapp/target/new.war /usr/local/tomcat/webapps
