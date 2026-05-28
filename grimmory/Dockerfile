ARG BUILD_FROM
FROM ${BUILD_FROM}

LABEL \
  io.hass.version="3.1.0" \
  io.hass.type="addon" \
  io.hass.arch="aarch64|amd64"

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
