FROM python:3.7-alpine

RUN apk add --update \
  curl \
  jq \
  bash

ADD ./requirements.txt ./
RUN pip install -r requirements.txt

ADD gitlab-ci-lint /usr/local/bin
RUN chmod +x /usr/local/bin/gitlab-ci-lint

CMD gitlab-ci-lint

