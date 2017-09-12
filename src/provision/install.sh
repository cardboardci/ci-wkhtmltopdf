#!/bin/sh
set -ex
cd /tmp/

apk add --update --no-cache xvfb ttf-freefont fontconfig dbus
apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted qt5-qtbase-dev wkhtmltopdf 

chmod +x /usr/bin/wkhtmltopdf-wrap
mv /usr/bin/wkhtmltopdf /usr/bin/wkhtmltopdf-origin
mv /usr/bin/wkhtmltopdf-wrap /usr/bin/wkhtmltopdf

rm -rf /tmp/* /var/tmp/* /var/cache/apk/*