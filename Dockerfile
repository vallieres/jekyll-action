FROM ruby:2.7-alpine

LABEL version="1.0.0"
LABEL repository="https://github.com/vallieres/jekyll-action"
LABEL homepage="https://github.com/vallieres/jekyll-action"
LABEL maintainer="Alexandre Vallières-Lagacé <alexandre@vallier.es>"

RUN apk add --no-cache git build-base

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
