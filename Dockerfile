FROM alpine

RUN apk add --update \
  curl \
  jq \
  bash

ADD gitlab-ci-lint /usr/local/bin
RUN chmod +x /usr/local/bin/gitlab-ci-lint

CMD gitlab-ci-lint
