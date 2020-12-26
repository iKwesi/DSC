# Use official image as parent image
FROM centos:latest

# Declare the maintainer of the dockerfile
LABEL maintainer = "Raphael Blankson"

# Install apache Webserver
RUN yum -y install httpd

# Set the working directory to webroot
WORKDIR /var/www/html/

# Copy the code from local directory to the container directory
COPY html /var/www/html/

# Run the command to launch Apache Webserver daemon
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for the website
EXPOSE 80
