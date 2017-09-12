# Dockerized WKHtmlToPDF

 * [Summary](#summary)
 * [Usage](#usage)
 * [Components](#components)
 * [Build Process](#build-process)
 * [Labels](#labels)
 * [User and Group Mapping](#user-and-group-mapping)

---

## Summary

A super small image with [wkhtmltopdf](https://wkhtmltopdf.org/) installed. 

## Image

[![Image][image-badge]][image-link]
[![License][license-badge]][license-link]
[![Build][build-badge]][build-link]
[![Docker][docker-badge]][docker-link]

## Usage

You can use this image locally with `docker run`, calling `wkhtmltopdf`:

```bash
docker run -v /media/:/media/ jrbeverly/wkhtmltopdf:privileged wkhtmltopdf http://google.com google.pdf
```

### Gitlab

You can setup a build job using `.gitlab-ci.yml`:

```yaml
compile:
  image: jrbeverly/wkhtmltopdf:baseimage
  script:
    - wkhtmltopdf http://google.com google.pdf
  artifacts:
    paths:
      - google.pdf
```

## Image Tags

Build tags available with the image: `jrbeverly/wkhtmltopdf`.

| Tag | Status | Description |
| --- | ------ | ----------- |
| [![Version base][base-badge]][base-link] | [![Image base][base-image-badge]][base-link] | A docker image with wkhtmltopdf installed, running as docker user (`DUID`). |
| [![Version privileged][privileged-badge]][privileged-link] | [![Image privileged][privileged-image-badge]][privileged-link] | A docker image with wkhtmltopdf installed, running with elevated permissions (root). |

## Components

### Metadata Arguments

Metadata build arguments used with the [Label Schema Convention](http://label-schema.org).

| Variable | Value | Description |
| -------- | ----- |------------ |
| BUILD_DATE | see [metadata.variable](build/Makefile.metadata.variable) | The Date/Time the image was built. |
| VERSION | see [metadata.variable](build/Makefile.metadata.variable) | Release identifier for the contents of the image. |
| VCS_REF | see [metadata.variable](build/Makefile.metadata.variable) | Identifier for the version of the source code from which this image was built. |

### Build Arguments

Build arguments used in the image.

| Variable | Value | Description |
| -------- | ------- |------------ |
| USER | see `Makefile.options` | Sets the [user](http://www.linfo.org/uid.html) to use when running the image. |
| DUID | see [user.variable](info/Makefile.user.variable) | The [user id](http://www.linfo.org/uid.html) of the docker user. |
| DGID | see [user.variable](info/Makefile.user.variable) | The [group id](http://www.linfo.org/uid.html) of the docker user's group. |
| APP_URL | see [app.variable](info/Makefile.app.variable) | The URL to download the latest debian package. |

### Volumes

No volumes are exposed by the docker container. However, while running the image with limited permissions (`baseimage`), it is necessary to ensure that the **docker user** has permission to access mounted volumes. You will need to ensure that the **docker user** can read/write to the mounted volumes. (see [User / Group Identifiers](#user-and-group-mapping))

The working directory of the image is `/media/`.

## Build Process

To build the docker image, use the included [`Makefile`](build/Makefile). It is recommended to use the makefile to ensure all build arguments are provided.

```bash
make VERSION=<version> build
```

You can view the [`build/README.md`](build/README.md) for more on using the `Makefile` to build the image.

## Labels

The docker image follows the [Label Schema Convention](http://label-schema.org). Label Schema is a community project to provide a shared namespace for use by multiple tools, specifically `org.label-schema`. The values in the namespace can be accessed by the following command:

```bash
docker inspect -f '{{ index .Config.Labels "org.label-schema.<LABEL>" }}' jrbeverly/wkhtmltopdf
```

### Label Extension

The label namespace `org.doc-schema` is an extension of `org.label-schema`. The namespace stores internal variables often used when interacting with the image. These variables will often be application versions or exposed internal variables. The values in the namespace can be accessed by the following command:

```bash
docker inspect -f '{{ index .Config.Labels "org.doc-schema.<LABEL>" }}' jrbeverly/wkhtmltopdf
```

## User and Group Mapping

All processes within the `baseimage` docker container will be run as the **docker user**, a non-root user. The **docker user** is created on build with the user id `DUID` and a member of a group with group id `DGID`.

Any permissions on the host operating system (OS) associated with either the user (`DUID`) or group (`DGID`) will be associated with the docker user. The values of `DUID` and `DGID` are visible in the [Build Arguments](#build-arguments), and can be accessed by the commands:

```bash
docker inspect -f '{{ index .Config.Labels "org.doc-schema.user" }}' jrbeverly/wkhtmltopdf:baseimage
docker inspect -f '{{ index .Config.Labels "org.doc-schema.group" }}' jrbeverly/wkhtmltopdf:baseimage
```

The notation of the build variables is short form for docker user id (`DUID`) and docker group id (`DGID`).

## Acknowledgements

The project icon is from [cre.ativo mustard, HK from the Noun Project](docs/icon/README.md).

[image-badge]: https://img.shields.io/badge/alpine-3.6-orange.svg?maxAge=2592000
[image-link]: https://hub.docker.com/r/_/alpine/ "The common base image."

[build-badge]: https://gitlab.com/jrbeverly-docker/docker-wkhtmltopdf/badges/master/build.svg
[build-link]: https://gitlab.com/jrbeverly-docker/docker-wkhtmltopdf/commits/master "Current build status."

[docker-badge]: https://img.shields.io/badge/jrbeverly-wkhtmltopdf-red.svg?maxAge=2592000
[docker-link]: https://hub.docker.com/r/jrbeverly/wkhtmltopdf/ "The docker image."

[license-badge]: https://images.microbadger.com/badges/license/jrbeverly/wkhtmltopdf.svg
[license-link]: https://microbadger.com/images/jrbeverly/wkhtmltopdf "Get your own license badge on microbadger.com"

[base-badge]: https://images.microbadger.com/badges/version/jrbeverly/wkhtmltopdf:baseimage.svg
[base-image-badge]: https://images.microbadger.com/badges/image/jrbeverly/wkhtmltopdf:baseimage.svg
[base-link]: https://microbadger.com/images/jrbeverly/wkhtmltopdf:baseimage "Get your own version badge on microbadger.com"

[privileged-badge]: https://images.microbadger.com/badges/version/jrbeverly/wkhtmltopdf:privileged.svg
[privileged-image-badge]: https://images.microbadger.com/badges/image/jrbeverly/wkhtmltopdf:privileged.svg
[privileged-link]: https://microbadger.com/images/jrbeverly/wkhtmltopdf:privileged "Get your own version badge on microbadger.com"