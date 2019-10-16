#For Debian 9
FROM debian:stretch-slim

LABEL maintainer="NGINX Docker Maintainers <docker-maint@nginx.com>"

# Download certificate and key from the customer portal (https://cs.nginx.com)
# and copy to the build context
COPY nginx-repo.crt /etc/ssl/nginx/
COPY nginx-repo.key /etc/ssl/nginx/

# Install NGINX Plus
RUN set -x \
  && apt-get update && apt-get upgrade -y \
  && apt-get install --no-install-recommends --no-install-suggests -y apt-transport-https ca-certificates gnupg1 curl python2.7 procps net-tools vim-tiny joe jq less \
  && \
  NGINX_GPGKEY=573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62; \
  found=''; \
  for server in \
    ha.pool.sks-keyservers.net \
    hkp://keyserver.ubuntu.com:80 \
    hkp://p80.pool.sks-keyservers.net:80 \
    pgp.mit.edu \
  ; do \
    echo "Fetching GPG key $NGINX_GPGKEY from $server"; \
    apt-key adv --keyserver "$server" --keyserver-options timeout=10 --recv-keys "$NGINX_GPGKEY" && found=yes && break; \
  done; \
  test -z "$found" && echo >&2 "error: failed to fetch GPG key $NGINX_GPGKEY" && exit 1; \
  echo "Acquire::https::plus-pkgs.nginx.com::Verify-Peer \"true\";" >> /etc/apt/apt.conf.d/90nginx \
  && echo "Acquire::https::plus-pkgs.nginx.com::Verify-Host \"true\";" >> /etc/apt/apt.conf.d/90nginx \
  && echo "Acquire::https::plus-pkgs.nginx.com::SslCert     \"/etc/ssl/nginx/nginx-repo.crt\";" >> /etc/apt/apt.conf.d/90nginx \
  && echo "Acquire::https::plus-pkgs.nginx.com::SslKey      \"/etc/ssl/nginx/nginx-repo.key\";" >> /etc/apt/apt.conf.d/90nginx \
  && printf "deb https://plus-pkgs.nginx.com/debian stretch nginx-plus\n" > /etc/apt/sources.list.d/nginx-plus.list \
  && apt-get update && apt-get install -y nginx-plus \
  && rm -rf /var/lib/apt/lists/*

# Forward request logs to Docker log collector
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Copy default NGINX Plus configs for index.html and /dashboard.html
COPY demo-index.html /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/
COPY status-dashboard.conf /etc/nginx/conf.d/
COPY nginx-plus-api.conf /etc/nginx/conf.d/

# Install NGINX Controller Agent
ARG API_KEY
ENV API_KEY=$API_KEY
ARG CTRL_HOST
ENV CTRL_HOST=$CTRL_HOST
ARG HOSTNAME
ENV HOSTNAME=$HOSTNAME

WORKDIR /controller

RUN curl -ksSL https://$CTRL_HOST:8443/1.4/install/controller/ | bash -s - -y \
  && apt-get remove --purge --auto-remove -y gnupg1 \
  && apt-get clean

RUN printf "#!/bin/sh\nservice controller-agent start\nnginx -g 'daemon off;'" > start.sh \
  && chmod +x start.sh

RUN ln -sf /dev/stdout /var/log/nginx-controller/agent.log
#RUN sed -i "s/hostname =/hostname = $HOSTNAME/" /etc/controller-agent/agent.conf
RUN sed -i "s/^uuid =.*/uuid =/" /etc/controller-agent/agent.conf
#RUN sed -i "s/INFO/DEBUG/" /etc/controller-agent/agent.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["sh", "service nginx restart"]
CMD ["sh", "/controller/start.sh"]

