# Jenkins image with git
FROM jenkins
MAINTAINER Phillip Rower <phillip.rower@csaa.com>
USER root
RUN apt-get update && apt-get install -y git maven ssh sshpass sudo g++ curl libssl-dev apache2-utils build-essential
RUN curl -SL http://nodejs.org/dist/v0.12.0/node-v0.12.0.tar.gz -o node-v0.12.0.tar.gz && tar xzf node-v0.12.0.tar.gz && cd node-v0.12.0 \
	&& ./configure && make && make install
ADD devnexus.tent.trt.csaa.pri /tmp/
RUN keytool -importcert -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -keypass changeit -storepass changeit -noprompt -alias devnexus -file /tmp/devnexus.tent.trt.csaa.pri
RUN apt-get update && apt-get install -y apt-utils rubygems-integration
RUN npm install -g grunt-cli
RUN gem install sass
ADD /etc/ /etc/
RUN adduser jenkins sudo
USER jenkins
VOLUME /var/jenkins_home
