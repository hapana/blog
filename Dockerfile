FROM alpine:3.9

ENV HUGO_VERSION=0.66.0

WORKDIR /site

# Inspired by https://github.com/orianna-zzo/hugo-docker-dev
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp
RUN apk add --update --no-cache ca-certificates \
    && cd /tmp \
    && tar -xf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz hugo \
    && mv /tmp/hugo /usr/local/bin/hugo \
    && rm -rf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

EXPOSE 1313

CMD ["hugo","server","-D","--bind", "0.0.0.0"]
