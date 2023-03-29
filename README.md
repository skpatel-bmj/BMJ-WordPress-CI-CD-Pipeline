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
