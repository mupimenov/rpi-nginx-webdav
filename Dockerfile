FROM arm32v7/nginx

ARG USER_ID
ARG GROUP_ID

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
    userdel -f nginx &&\
    if getent group nginx ; then groupdel nginx; fi &&\
    groupadd -g ${GROUP_ID} nginx &&\
    useradd -l -u ${USER_ID} -g nginx nginx \
;fi

RUN apt-get update \
 && apt-get install -y --no-install-recommends nginx-extras libnginx-mod-http-dav-ext apache2-utils

VOLUME /data
EXPOSE 80
COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
CMD /entrypoint.sh && nginx -g "daemon off;"