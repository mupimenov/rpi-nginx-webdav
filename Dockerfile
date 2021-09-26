FROM arm32v7/nginx

RUN apt-get update \
 && apt-get install -yq --no-install-recommends nginx-extras libnginx-mod-http-dav-ext apache2-utils

VOLUME /data
EXPOSE 80
COPY default.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
CMD /entrypoint.sh && nginx -g "daemon off;"