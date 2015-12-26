FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER daicho
CMD [""]
ENTRYPOINT ["java", "-jar", "/usr/local/jenkins/jenkins.war"]
EXPOSE 8080

ENV JENKINS_HOME /usr/local/jenkins

RUN \
    mkdir -p /usr/local/jenkins ; \
    adduser -D -H -s /bin/sh jenkins ; \
    chown -R jenkins:jenkins /usr/local/jenkins/ ; \
    wget http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war -O /usr/local/jenkins/jenkins.war; \
    chmod 644 /usr/local/jenkins/jenkins.war


