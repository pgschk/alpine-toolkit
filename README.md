[![Docker publish](https://github.com/pgschk/alpine-toolkit/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/pgschk/alpine-toolkit/actions/workflows/docker-publish.yml)
[![ghcr publish](https://github.com/pgschk/alpine-toolkit/actions/workflows/ghcr-publish.yml/badge.svg)](https://github.com/pgschk/alpine-toolkit/actions/workflows/ghcr-publish.yml)
![GitHub release (with filter)](https://img.shields.io/github/v/release/pgschk/alpine-linux)
[![Daily Vulnerability Scan](https://github.com/pgschk/alpine-toolkit/actions/workflows/trivy-schedule.yml/badge.svg)](https://github.com/pgschk/alpine-toolkit/actions/workflows/trivy-schedule.yml)


# Alpine Toolkit

An alpine container with some debugging tools installed.


## Included tools

The following tools are currently included in Docker image `pgschk/alpine-toolkit:latest`:

- telnet
- netcat
- curl
- tcpdump


## Extended images

Additionally there is an extended image, which includes more tools at the cost of being larger.
The image `pgschk/alpine-toolkit:latest-extended` additionally includes:

- mosquittio-clients (mosquitto_sub, mosquitto_pub)
- strace


## Add additional tools

To add more packages, build the container with the build argument "EXTRA_PACKAGES" set to a list of [Alpine packages](https://pkgs.alpinelinux.org/packages):

```
docker buildx build --build-arg EXTRA_PACKAGES="mosquitto-clients" -t alpine-toolkit:local .
```


## Use as Kubernetes debug

You can use `kubectl debug` to attach the container to an existing pod to get access to the debugging tools.

### Example

We will assume that our pod is named "my-pod" with a container "my-container", which we want to attach to:

```
kubectl debug -it my-pod --image=pgschk/alpine-toolkit --target=mycontainer
```