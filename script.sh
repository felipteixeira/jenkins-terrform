#!/bin/bash
sudo apt update
curl -fsSL https://get.docker.com/ | bash

docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

