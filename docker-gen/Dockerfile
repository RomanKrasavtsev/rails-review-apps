FROM jwilder/docker-gen
ADD docker-gen.cfg /root/
ADD nginx.tmpl /root/
RUN mkdir /root/nginx/
CMD "--config /root/docker-gen.cfg"
