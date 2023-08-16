#!/bin/bash


sudo apt-get update
sudo apt-get install default-jdk -y


sudo apt-get install maven -y

# Script for Jenkins installation


curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null



echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins

sudo apt-get update 
sudo apt-get install jenkins -y
sudo apt-get enable jenkins
