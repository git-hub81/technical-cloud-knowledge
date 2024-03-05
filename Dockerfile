FROM httpd
RUN yum -y update && \
    yum install -y httpd unzip zip && \
    yum clean all
RUN curl -L -o /var/www/html/oxer.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
RUN unzip oxer.zip && \
    cp -rvf oxer-html/* . && \
    rm -rf *.zip oxer-html
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
