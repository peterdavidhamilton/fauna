FROM ruby:2.6-alpine

RUN apk --no-cache upgrade && \
    apk --no-cache add build-base openldap-clients

VOLUME /src

WORKDIR /src

ENTRYPOINT ["/src/entrypoint.sh"]

CMD ["/src/bin/console"]
