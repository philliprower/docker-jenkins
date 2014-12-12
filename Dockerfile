# Jenkins image with git
FROM jenkins
MAINTENER Phillip Rower <phillip.rower@csaa.com>
USER root
RUN apt-get update && apt-get install -y git maven
ADD devnexus.tent.trt.csaa.pri /tmp/
RUN keytool -importcert -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -keypass changeit -storepass changeit -noprompt -alias devnexus -file /tmp/devnexus.tent.trt.csaa.pri
USER jenkins
VOLUME /var/jenkins_home
