FROM centos:latest
MAINTAINER dev@gmail.com
RUN yum install httpd -y
RUN yum install unzip -y
RUN yum install zip -y 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip /var/www/html
WORKDIR /var/www/html
RUN unzip oxer.zip 
RUN cp -rvf oxer-html/* .
RUN rm -rf *.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
