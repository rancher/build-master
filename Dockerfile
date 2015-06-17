FROM rancher/dind:v0.4.0

MAINTAINER Bill Maxwell "<bill@rancher.com>"

COPY ./scripts /opt/cattle/scripts
RUN /opt/cattle/scripts/bootstrap

VOLUME /opt/cattle

WORKDIR /opt/cattle

EXPOSE 8080
ENV CATTLE_IDEMPOTENT_CHECKS false

CMD [ "/opt/cattle/scripts/run" ]
