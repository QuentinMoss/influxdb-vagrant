FROM centos:centos7.3.1611
MAINTAINER Quentin Moss <quejmoss@gmail.com>
LABEL name="Chronograf Beta5"

ENV RPM_DOWNLOAD https://dl.influxdata.com/chronograf/releases/chronograf-1.1.0~beta5.x86_64.rpm

RUN yum update -y
RUN yum update -y && \
    curl -O ${RPM_DOWNLOAD} && \
    rpm -i chronograf-1.1.0~beta5.x86_64.rpm && \
    rm -rf chronograf-1.1.0~beta5.x86_64.rpm && \
    mkdir -p /var/lib/chronograf

VOLUME /var/lib/chronograf

CMD ['chronograf']

EXPOSE 8888
