FROM ubuntu
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y git
RUN mkdir /root/.ssh/
ADD ~/.ssh/id_rsa /root/.ssh/id_rsa
RUN apt-get install -y curl
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.1"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
MAINTAINER Roman Krasavtsev “roman@workinstartup.ru"
