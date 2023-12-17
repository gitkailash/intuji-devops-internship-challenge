#This is docker file
FROM httpd:latest

# Copy the PHP application files to the webserver root
COPY . /usr/local/apache2/htdocs/
