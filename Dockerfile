# Jenkins image with git
FROM jenkins
MAINTENER Phillip Rower <phillip.rower@csaa.com>
USER root
RUN apt-get update && apt-get install -y git maven
USER jenkins
VOLUME /var/jenkins_home
