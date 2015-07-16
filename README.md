# terraform-introduction

This repo is for the ThoughtWorks Chicago Office lunch and learn for July 15, 2015.  Instructions provided are very general and unfortunately I will not provide hands on support during the lunch and learn.  If it doesn't work, Google it and provide a pull request so future people know what a dope I am :-)

Goal of this repo is to get a working HA Docker Repository that uses Terraform to provision the Infrastructure, Ansible to configure the Application servers, and take advantage of Docker to provide the application itself.

### SETUP

## Vagrant

First thing we want to do is make sure that Vagrant is installed and you have the AWS plugin installed as well.  So go ahead and download Vagrant and ensure that it's installed. 

> vagrant plugin install vagrant-aws

When those are installed its time to configure your vagrant environment.  

##### Setting up your AWS access keys
You'll need to load your AWS secrets into your environment variables.  

1. Grab your AWS access keys from your AWS account.  Be very careful to NEVER COMMIT THESE KEYS.  I can't stress that enough.  If you don't know what your access keys are do this: IAM > Users > [Choose your user] > Create Access key > Download .  Your access and secret keys are here.
2. Create an SSH keypair.  Download the .pem file.  EC2 > Key Pairs > [Give it a name] .  Your browser will download the .pem file.  You'll need to chmod it with 600 settings.  chmod 0600 /path/to/pem

You can temporarily load these values as environment variables for your current session with:
```
export AWS_KEY="Your_aws_access_key"
export AWS_SECRET="Your_aws_secret_key"
export AWS_KEYNAME="Name_of_your_ssh_key_in_aws"
```

You can perminently add these variables to your environment by adding those three lines to your ~/.profile and they will take effect next time you login.

##### Configuring Vagrant

Edit the file at vagrant/Vagrantfile

1. Select your region, I'm just using us-west-2 AKA Oregon
2. Grab a subnet ID.  You can do that from VPC > Subnets
3. Grab an AMI that uses Amazon Linux.  The one I provided works in us-west-2, but if you're making in another region find one that works for you.
4. Create a subnet group that allows ssh from 0.0.0.0/0.  Then grab it's ID and supply it to your Vagrant file.
5. Tag your instance appropriately so you can find it in the future
6. Associate a Public IP to it so you can connect to it, and so the instance can access the Internet
7. As long as you're using Amazon Linux you can leave the override username alone as ec2-user
8. Override the ssh private key with the path to the .pem you downloaded earlier

You should now be able to provision the instance and ssh into it.

> vagrant up

> vagrant ssh

## Terraform

From inside your Vagrant box in AWS we'll want to setup Terraform.  Go ahead and download it from Hashicorp.  Here's the link as of today: https://www.terraform.io/downloads.html .  You'll probably want the latest Linux zip file.

> wget https://dl.bintray.com/mitchellh/terraform/terraform_0.6.0_linux_amd64.zip 

Go ahead and unzip it into /usr/local/bin .  This places all the terraform binaries into a folder that is already part of your $PATH.  You'll want to sudo or run as root since you won't have access to the directory without it.

> sudo unzip terraform_* -d /usr/local/bin

Check to see if it's working by getting the terraform version.

```
terraform -version
Terraform v0.6.0
```

## Ansible

Now for the final piece, lets install Ansible.  This is quite simple versus the other tools.

> sudo pip install ansible

And check the version to make sure everything installed correctly.

> ansible --version

I'm getting a warning about a timing attack vulnerability, but I'll be ignoring that for this demo.
