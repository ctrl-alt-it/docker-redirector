FROM alpine:latest
RUN apk --no-cache add nginx \
 && rm -f /var/log/nginx/error.log \
 && ln -s /dev/stderr /var/log/nginx/error.log \
 && rm -f /var/log/nginx/access.log \
 && ln -s /dev/stdout /var/log/nginx/access.log \
 && mkdir -p /opt/nginx \
 && chown nginx:nginx /opt/nginx
ADD nginx.conf /etc/nginx/nginx.conf 
USER nginx
CMD ["/usr/sbin/nginx"]
