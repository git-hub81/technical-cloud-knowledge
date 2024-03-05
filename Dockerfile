FROM centos:latest
MAINTAINER dev@gmail.com
RUN yum install -y httpd
RUN yum install -y unzip
RUN yum install -y zip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip /var/www/html
WORKDIR /var/www/html
RUN unzip oxer.zip 
RUN cp -rvf oxer-html/* .
RUN rm -rf *.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
