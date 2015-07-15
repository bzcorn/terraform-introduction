# terraform-introduction

## Vagrant

First thing we want to do is make sure that Vagrant is installed and you have the AWS plugin installed as well.  So go ahead and download Vagrant and ensure that it's installed.  You'll also need the AWS plugin as well, and download a dummy box file.


> vagrant plugin install vagrant-aws

> vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box

When those are installed its time to configure your vagrant file.  

1. Grab your AWS access keys from your AWS account.  Be very careful to NEVER COMMIT THESE KEYS.  I can't stress that enough.  If you don't know what your access keys are do this: IAM > Users > [Choose your user] > Create Access key > Download .  Your access and secret keys are here.
2. Create an SSH keypair.  Download the .pem file.  EC2 > Key Pairs > [Give it a name] .  Your browser will download the .pem file.  You'll need to chmod it with 600 settings.  chmod 0600 /path/to/pem
3. Select your region, I'm just using us-west-2 AKA Oregon
4. Grab a subnet ID.  You can do that from VPC > Subnets
5. Grab an AMI that uses Amazon Linux.  The one I provided works in us-west-2, but if you're making in another region find one that works for you.
6. Create a subnet group that allows ssh from 0.0.0.0/0.  Then grab it's ID and supply it to your Vagrant file.
7. Tag your instance appropriately so you can find it in the future
8. Associate a Public IP to it so you can connect to it, and so the instance can access the Internet
9. As long as you're using Amazon Linux you can leave the override username alone as ec2-user
10. Override the ssh private key with the path to your .pem you downloaded in step 2

