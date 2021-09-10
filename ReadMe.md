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
cat .gitlab-ci.yml | docker run --rm -i gableroux/gitlab-ci-lint:v1.0.0
```

### Shell script

You'll need [`yq`](https://github.com/mikefarah/yq) and `gitlab-ci-lint` in your `$PATH` (you can clone this project and link to it too).

```bash
cat .gitlab-ci.yml | ./gitlab-ci-lint
# or
./gitlab-ci-lint .gitlab-ci.yml
# or
./gitlab-ci-lint
```

### in your CI pipeline (`.gitlab-ci.yml`)

```yaml
test-ci-file:
  image: gableroux/gitlab-ci-lint:v1.0.0
  script:
  - gitlab-ci-lint example.gitlab-ci.yml
```

Note: a gitlab-ci job will automatically set `$CI_JOB_TOKEN` which is now required by [`/ci/lint` gitlab api](https://docs.gitlab.com/ce/api/lint.html).

### gitlab token subject

You can set `$CI_JOB_TOKEN` or `$GITLAB_TOKEN` environment variable before invoking the script. 

```bash
GITLAB_TOKEN=EXAMPLE_TOKEN ./gitlab-ci-lint
```

You can also pass it as a 3rd parameter. Example:  

```bash
./gitlab-ci-lint .gitlab-ci.yml https://gitlab.com/api/v4 EXAMPLE_TOKEN
```

:warning: Using a secret token directly in a shell command is unsafe and should be avoided as it will be written to your shell history. A workaround is to create your own script, write the command in that script and invoke the script. Or you could also set this secret from your `.bashrc` file.

### Handy function for your shell

```bash
gitlab-ci-lint () {
	cat ${1:-.gitlab-ci.yml} | docker run --rm -i gableroux/gitlab-ci-lint:v1.0.0
}
```

This way, you go in a project and type `gitlab-ci-lint` or `gitlab-ci-lint custom-gitlab-ci-file.yml`. :tada:

## FAQ

### Why?

I wrote some project generators using [cookiecutter](https://github.com/audreyr/cookiecutter) and managed to generate `.gitlab-ci.yml` files. I wanted to lint them in the ci to know when I break things.

### Is this safe?

You should not execute things from the internets, read your scripts before executing them.

### Can I contribute

Yeah why not? Feel this can be improved? Fork and send a PR. :tada:

### Alternatives

* https://www.npmjs.com/package/gitlab-ci-lint
* https://gitlab.com/orobardet/gitlab-ci-linter

## License

[MIT](LICENSE.md) © [Gabriel Le Breton](https://gableroux.com)
