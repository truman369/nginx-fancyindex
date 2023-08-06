ARG ALPINE_VERSION=3.18

FROM alpine:${ALPINE_VERSION}
ARG NGINX_VERSION=1.24.0
ARG PKG_RELEASE=6

RUN apk add --no-cache \
    tzdata \
    nginx=${NGINX_VERSION}-r${PKG_RELEASE} \
    nginx-mod-http-fancyindex=${NGINX_VERSION}-r${PKG_RELEASE};

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
