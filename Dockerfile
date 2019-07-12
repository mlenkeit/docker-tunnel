FROM nginx:alpine

RUN apk add --no-cache bash autossh

ENV PORTS "80:3000,443:3001"
ENV PROXY_HOST "1.2.3.4"
ENV PROXY_SSH_PORT "22"
ENV PROXY_SSH_USER "user"
ENV APP_IP ""

ADD start.sh /
RUN chmod +x /start.sh

ADD .htpasswd /
ADD nginx.conf.template /

ENTRYPOINT ["/start.sh"]
