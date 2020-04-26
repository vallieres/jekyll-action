FROM ruby:2.7-alpine

LABEL version="1.0.0"
LABEL repository="https://github.com/lemonarc/jekyll-action"
LABEL homepage="https://github.com/lemonarc/jekyll-action"
LABEL maintainer="Leon Aves <leon@lemonarc.com>"

RUN apk add --no-cache git build-base

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
