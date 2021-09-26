FROM arm32v7/nginx

RUN apt-get update \
 && apt-get install -y --no-install-recommends nginx-extras libnginx-mod-http-dav-ext apache2-utils

VOLUME /data
EXPOSE 80
COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
CMD /entrypoint.sh && nginx -g "daemon off;"