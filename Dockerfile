# Jenkins LTS avec JDK 17 (fournit deja java + javac + git) auquel on ajoute Python 3.
# Ainsi la pipeline peut executer : javac HelloWorld.java, java HelloWorld, python3 hello.py
FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update \
    && apt-get install -y python3 docker.io maven \
    && rm -rf /var/lib/apt/lists/*

USER jenkins
