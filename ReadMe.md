# docker-gitlab-ci-lint

[![Docker Stars](https://img.shields.io/docker/stars/gableroux/gitlab-ci-lint.svg)](https://hub.docker.com/r/gableroux/gitlab-ci-lint)
[![Docker Pulls](https://img.shields.io/docker/pulls/gableroux/gitlab-ci-lint.svg)](https://hub.docker.com/r/gableroux/gitlab-ci-lint)
[![Docker Automated](https://img.shields.io/docker/automated/gableroux/gitlab-ci-lint.svg)](https://hub.docker.com/r/gableroux/gitlab-ci-lint)
[![Docker Build](https://img.shields.io/docker/build/gableroux/gitlab-ci-lint.svg)](https://hub.docker.com/r/gableroux/gitlab-ci-lint)
[![Image](https://images.microbadger.com/badges/image/gableroux/gitlab-ci-lint.svg)](https://microbadger.com/images/gableroux/gitlab-ci-lint)
[![Version](https://images.microbadger.com/badges/version/gableroux/gitlab-ci-lint.svg)](https://microbadger.com/images/gableroux/gitlab-ci-lint)
[![Layers](https://images.microbadger.com/badges/image/gableroux/gitlab-ci-lint.svg)](https://microbadger.com/images/gableroux/gitlab-ci-lint)

Docker image and script to lint `.gitlab-ci.yml` files using `https://gitlab.com/api/v4/ci/lint`. 

Inspired by [this gist](https://gist.github.com/Betree/56f9669c3adb2a1633429ff321198fff)

## How to use

### Docker image

```bash
cat .gitlab-ci.yml | docker run --rm -i gableroux/gitlab-ci-lint
```

### Shell script

You'll need to install dependencies first if you go this way.

```bash
cat .gitlab-ci.yml | ./gitlab-ci-lint
# or
./gitlab-ci-lint .gitlab-ci.yml
```

### `.gitlab-ci.yml`

```bash
test-ci-file:
  image: gableroux/gitlab-ci-lint
  script:
  - gitlab-ci-lint .gitlab-ci.yml
```


## FAQ

### Why?

I wrote some project generators using [cookiecutter](https://github.com/audreyr/cookiecutter) and I wanted to lint its generated `.gitlab-ci` so I know when I break things.

### Is this safe?

You should not execute things from the internets, read your scripts before executing them.

### Can I contribute

Yeah why not? Feel this can be improved? Fork and send a PR. :tada:

## License

[MIT](LICENSE.md) © [Gabriel Le Breton](https://gableroux.com)
