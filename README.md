# Mediawiki installation on AWS using Terraform, Docker and Kubernetes

## Pre-requisites

### AWS
- Create Access Key on AWS account.
- Install AWS CLI using ```sudo apt install awscli```
- Configure AWS access credentials using ```aws configure```

### Terraform
On Ubuntu:

```sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform```






