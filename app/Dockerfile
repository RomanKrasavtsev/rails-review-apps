FROM ruby:2.3.1
ARG DEBIAN_FRONTEND=noninteractive
RUN mkdir /home/app/
RUN \
  apt-get update  && \
  apt-get install tzdata && \
  apt-get install -y libpq-dev && \
  apt-get install -y nodejs
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "bundle config --global silence_root_warning 1"
RUN /bin/bash -l -c "cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime"
RUN /bin/bash -l -c "echo 'Europe/Berlin' > /etc/timezone"
ADD database.yml /root/
ADD start.sh /root/
ENTRYPOINT /root/start.sh
EXPOSE 9292
