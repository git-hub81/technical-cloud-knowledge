FROM centos:8
RUN yum clean all && \
    yum makecache
RUN sed -i 's/mirrorlist=/#mirrorlist=/g' /etc/yum.repos.d/CentOS-AppStream.repo && \
    sed -i 's/#baseurl=/baseurl=/g' /etc/yum.repos.d/CentOS-AppStream.repo
RUN yum -y update && \
    yum install -y httpd unzip zip && \
    yum clean all
RUN curl -L -o /var/www/html/oxer.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
RUN unzip oxer.zip && \
    cp -rvf oxer-html/* . && \
    rm -rf *.zip oxer-html
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
