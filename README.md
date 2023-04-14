# DevOps(CI/CD) Pipeline
<img width="584" alt="Screenshot 2023-03-29 120023" src="https://user-images.githubusercontent.com/125953981/228519161-70adf468-066e-4cae-a4b7-7390d0f504a6.png">

## BMJ-WordPress-CI-CD-Pipeline
<img width="744" alt="Screenshot 2023-03-29 135858" src="https://user-images.githubusercontent.com/125953981/228518808-fad33d6e-d820-4f76-a911-afb2c63c11b5.png">

### CI/CD pipeline phases
```
Continuous planning
Continuous coding
Continuous Build
Continuous testing
Continuous containerization
Continuous Deploy
Continuous operation
Continuous monitoring
Continuous feedback
```
### block diagram
<img width="555" alt="Screenshot 2023-04-04 174600" src="https://user-images.githubusercontent.com/125953981/229788739-7b682a33-a77e-44c5-bf58-36a3f4292ab4.png">

## Jenkins Installing Using User data
### this program file install jenking for permanent in Debian Unbuntu server
```
#! /bin/bash
sudo apt-get update 
sudo apt-get install -y openjdk-11-jdk
sudo apt-get install -y git maven
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
sudo systemctl start jenkins
```
## Installation of Jenkins on EC2 Instance
```
#! /bin/bash
sudo yum update –y
sudo yum install git -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo dnf install java-11-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
```
## Main JenkinFile Code
```
pipeline {
    agent any
    stages {
        stage('Deployment-On-Stg-Server') {
            steps {
                echo "##############################################################################################"
                echo "Deployment On Stg Server Starting...."
                sshagent(credentials: ['Web-Server'], ignoreMissing: true) 
                {
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo systemctl restart httpd'"    
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo rm -rf *'"
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo git clone https://github.com/Ersandeep977/BMJ-test.git'"
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo rm -rf /var/www/html/*'"
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo cp BMJ-test/i.html /var/www/html/'"
                 }
                echo "##############################################################################################"    
                echo "Deployment On Stg Server .... Done"
            }
        }
        stage('Deployment-On-Live-Server') {
            steps {
                echo "##############################################################################################"
                echo "Deployment On Live Server Starting...."
                sshagent(credentials: ['Web-Server'], ignoreMissing: true)
                {
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo systemctl restart httpd'"
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo rm -rf *'"
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo git clone https://github.com/Ersandeep977/BMJ-test.git'"
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo rm -rf /var/www/html/*'"
                sh " ssh -o  StrictHostKeyChecking=no ec2-user@<Pubilc IP> 'sudo cp BMJ-test/i.html /var/www/html/'"
                }
                echo "##############################################################################################"    
                echo "Deployment On Live Server .... Done"
            }
        }
    }
    post {
      always { echo "This block always runing....."}
      aborted { echo "build process is aborted.....................OK" }
      failure { echo "build is failed..............OK" }
      success { echo "build is succeeded........OK" }
      unsuccessful { echo "This block runs when the current status is anything except success." }
    }
}
```
## Jenkins Dashboard 
<img width="949" alt="Screenshot 2023-04-11 105932" src="https://user-images.githubusercontent.com/125953981/231065569-fdfedbd9-c1d4-4ca2-a701-59f9c3712aa0.png">

## Jenkins Console Output
```
Started by upstream project "Git-Hub-Webhook" build number 26
originally caused by:
 Started by GitHub push by Ersandeep977
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Deployment
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Deployment-On-Stg-Server)
[Pipeline] echo
##############################################################################################
[Pipeline] echo
Deployment On Stg Server Starting....
[Pipeline] sshagent
[ssh-agent] Using credentials ec2-user (wp-server)
[ssh-agent] Looking for ssh-agent implementation...
[ssh-agent]   Exec ssh-agent (binary ssh-agent on a remote machine)
$ ssh-agent
SSH_AUTH_SOCK=/tmp/ssh-XXXXXXakyeFB/agent.2772
SSH_AGENT_PID=2774
Running ssh-add (command line suppressed)
Identity added: /var/lib/jenkins/workspace/Deployment@tmp/private_key_15066038905127290818.key (/var/lib/jenkins/workspace/Deployment@tmp/private_key_15066038905127290818.key)
[ssh-agent] Started.
[Pipeline] {
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.92.61.179 'sudo systemctl restart httpd'
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.92.61.179 'sudo rm -rf *'
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.92.61.179 'sudo git clone https://github.com/Ersandeep977/BMJ-test.git'
Cloning into 'BMJ-test'...
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.92.61.179 'sudo rm -rf /var/www/html/*'
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.92.61.179 'sudo cp BMJ-test/i.html /var/www/html/'
[Pipeline] }
$ ssh-agent -k
unset SSH_AUTH_SOCK;
unset SSH_AGENT_PID;
echo Agent pid 2774 killed;
[ssh-agent] Stopped.
[Pipeline] // sshagent
[Pipeline] echo
##############################################################################################
[Pipeline] echo
Deployment On Stg Server .... Done
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deployment-On-Live-Server)
[Pipeline] echo
##############################################################################################
[Pipeline] echo
Deployment On Live Server Starting....
[Pipeline] sshagent
[ssh-agent] Using credentials ec2-user (wp-server)
[ssh-agent] Looking for ssh-agent implementation...
[ssh-agent]   Exec ssh-agent (binary ssh-agent on a remote machine)
$ ssh-agent
SSH_AUTH_SOCK=/tmp/ssh-XXXXXXm8Byng/agent.2900
SSH_AGENT_PID=2902
Running ssh-add (command line suppressed)
Identity added: /var/lib/jenkins/workspace/Deployment@tmp/private_key_2377313605624249529.key (/var/lib/jenkins/workspace/Deployment@tmp/private_key_2377313605624249529.key)
[ssh-agent] Started.
[Pipeline] {
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.88.70.231 'sudo systemctl restart httpd'
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.88.70.231 'sudo rm -rf *'
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.88.70.231 'sudo git clone https://github.com/Ersandeep977/BMJ-test.git'
Cloning into 'BMJ-test'...
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.88.70.231 'sudo rm -rf /var/www/html/*'
[Pipeline] sh
+ ssh -o StrictHostKeyChecking=no ec2-user@3.88.70.231 'sudo cp BMJ-test/i.html /var/www/html/'
[Pipeline] }
$ ssh-agent -k
unset SSH_AUTH_SOCK;
unset SSH_AGENT_PID;
echo Agent pid 2902 killed;
[ssh-agent] Stopped.
[Pipeline] // sshagent
[Pipeline] echo
##############################################################################################
[Pipeline] echo
Deployment On Live Server .... Done
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] echo (hide)
This block always runing.....
[Pipeline] echo
build is succeeded........OK
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```

## Install docker
```
#! /bin/bash
apt-get update
curl -fsSL https://test.docker.com -o test-docker.sh
sh test-docker.sh
```
# Docker-compose file Example
## LAMP Container Architecture
```
---
version: '3.8'
services:
  mydb:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: sandeep
  apache:
    image: httpd
    ports:
      - 9999:80
    links:
      - mydb:mysql
  php:
    image: php:7.2-apache
    links:
      - mydb:mysql
      - apache:httpd
...
```
### Command
```
# vim docker-compose.yml
# docker compose up -d
# docker compose stop
# docker compose down
```
## 
```
stage('Filter New Changs') {
            steps {
                echo 'filter out new changes......................'
                sh 'find -type f -mmin -1 | grep -v ".git"'
            }
        }
```   
## bash script
```
#! /bin/bash

echo "Clear all folder...."
sudo rm -rf backup/*
echo "HTML Backup Creation....."
sudo mkdir backup/html$(date +"%Y%m%d-%H%M%S")
sudo cp -r /var/www/html/* backup/html$(date +"%Y%m%d-%H%M%S")
echo ""
echo "HTML Backup Creation....."
echo ""
echo "SQl Backup Creation...."
mysql -u root -p root webdata > backup/dbserver-$(date +\%Y\%m\%d-%H\%M\%S).sql
echo ""
echo "Upload to s3 bucket....."
aws s3 sync backup s3://bmj-wp-lamp-server/
echo ""
echo "all task done..."
```

