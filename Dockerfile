FROM alpine:latest

RUN apk --no-cache add nginx \
 && rm -f /var/log/nginx/error.log \
 && ln -s /dev/stderr /var/log/nginx/error.log \
 && rm -f /var/log/nginx/access.log \
 && ln -s /dev/stdout /var/log/nginx/access.log \
 && mkdir -p /opt/nginx \
 && chown nginx:nginx /opt/nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD start.sh /usr/bin/start.sh

RUN chown -R nginx /etc/nginx
RUN chmod +x /usr/bin/start.sh
USER nginx

CMD [ "/usr/bin/start.sh" ]
