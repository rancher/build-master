FROM rancher/docker-dind-base:v0.4.1

MAINTAINER Bill Maxwell "<bill@rancher.com>"

ADD ./scripts /opt/cattle/scripts
RUN /opt/cattle/scripts/bootstrap

CMD [ "/opt/cattle/scripts/run" ]
