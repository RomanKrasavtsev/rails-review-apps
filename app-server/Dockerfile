FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
RUN mkdir /home/app/
RUN mkdir /root/.ssh/
RUN apt-get update
RUN apt-get install -y libpq-dev nodejs git curl
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.1"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "bundle config --global silence_root_warning 1"
ADD id_rsa /root/.ssh
RUN chmod 700 /root/.ssh/id_rsa
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
MAINTAINER Roman Krasavtsev "roman@workinstartup.ru"
