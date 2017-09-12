FROM alpine:3.6

#
# Environment Variables
#
ENV HOME=/

#
# Provision
#
COPY rootfs/ /

COPY provision/install.sh /tmp/install.sh
RUN sh /tmp/install.sh && rm -f /tmp/install.sh

#
# Options
#
WORKDIR /media
ENTRYPOINT []
CMD []

#
# User
#
ARG DUID
ARG DGID
RUN addgroup -g ${DGID} -S docker && adduser -S -G docker -u ${DUID} docker

ARG USER
USER $USER

#
# Metadata Arguments
#
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

#
# Metadata
#
LABEL \
    maintainer="jrbeverly" \
    \
    org.label-schema.name="wkhtmltopdf" \
    org.label-schema.summary="A super small image with wkhtmltopdf installed." \
    org.label-schema.description="wkhtmltopdf renders HTML into PDF using the Qt WebKit rendering engine." \
    org.label-schema.maintainer="jrbeverly" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.version=$VERSION \
    org.label-schema.url="https://wkhtmltopdf.org/" \
    org.label-schema.license="MIT" \
    org.label-schema.docker.cmd="docker run -v $(pwd):/media/ jrbeverly/wkhtmltopdf:privileged wkhtmltopdf http://google.com google.pdf" \
    org.label-schema.vendor="jrbeverly" \
    org.label-schema.schema-version="1.0" \
    \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://gitlab.com/jrbeverly-docker/docker-wkhtmltopdf" \
    \
    org.doc-schema.project="wkhtmltopdf" \
    org.doc-schema.summary="A super small image with wkhtmltopdf installed, running as the $USER user." \
    org.doc-schema.user=$DUID \
    org.doc-schema.group=$DGID