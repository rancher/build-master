FROM rancher/docker-dind-base:v0.4.1

MAINTAINER Bill Maxwell "<bill@rancher.com>"

COPY ./scripts /opt/cattle/scripts
RUN /opt/cattle/scripts/bootstrap

WORKDIR /opt/cattle

CMD [ "/opt/cattle/scripts/run" ]
