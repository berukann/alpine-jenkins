FROM alpine:latest
MAINTAINER daicho

RUN apk --update add openjdk7 ttf-dejavu &&\
    rm -rf /var/cache/apk/*

ENV JENKINS_HOME /usr/local/jenkins

RUN mkdir -p /usr/local/jenkins
RUN adduser -D -H -s /bin/sh jenkins 
RUN chown -R jenkins:jenkins /usr/local/jenkins/
ADD http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war /usr/local/jenkins/jenkins.war
RUN chmod 644 /usr/local/jenkins/jenkins.war

ENTRYPOINT ["java", "-jar", "/usr/local/jenkins/jenkins.war"]
EXPOSE 8080
CMD [""]
