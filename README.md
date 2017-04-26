Docker for my R setup
=======================

This is a Dockerfile for creating an RStudio server instance, including various packages that I find useful. It is based on the rocker/verse:latest image.

Intention is for this to be used to run RStudio server within an AWS EC2 instance, which is already running docker (need to check this also has git).

Want to be able to link files from the docker container to the EC2 instance, which in turn should be linked to 


http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html


```bash
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
```
Log out and log back in again to pick up the new docker group permissions.
```bash
docker info
```

Clone this repo and build, then run, docker image
```bash
sudo yum install -y git
git clone git://github.com/nickforr/myrsetup.git rsetup
cd rsetup
docker build -t rsetup .
docker run -d -p 8787:8787 --name rsetup -v /dev/sdb:/home/nickforr/ -e USER=nickforr -e PASSWORD=<password> rsetup

```
