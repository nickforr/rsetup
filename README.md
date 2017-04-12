Docker for my R setup
=======================

This is a Dockerfile for creating an RStudio server instance, including various packages that I find useful. It is based on the rocker/verse:latest image.

Intention is for this to be used to run RStudio server within an AWS EC2 instance, which is already running docker (need to check this also has git).

Want to be able to link files from the docker container to the EC2 instance, which in turn should be linked to 

## Usage:

Start an RStudio server container. From the docker window: 

```bash
git clone 
cd ...
docker build -t myrsetup .
docker run -d -p 8787:8787 -e USER=<username> -e PASSWORD=<password> -v $(pwd):/home/$USER/foo -e USERID=$UID  myrsetup
```

Use the `docker-machine ip` to determine the ip address for your local or remote machine command, then visit that address
appended with the port `:8787`.  You can now log in to the session with the default username and password.

- username: rstudio 
- password: rstudio


For customization details, including custom passwords & shared volumes see [Using the Rstudio image](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image)

In a real deployment scenario, you will probably want to run the container in detached mode (`-d`) and listening on the host's port 80 (`-p 80:8787`) and also customize the username and password: (important for publicly hosted/cloud instances):

```sh
docker run -d -p 80:8787 -e USER=<username> -e PASSWORD=<password> hymans-r
```


## Trademarks

RStudio is a registered trademark of RStudio, Inc. Please review RStudio's trademark use policy and address inquiries about further distribution or other questions to permissions@rstudio.com.
