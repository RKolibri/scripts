#!/bin/bash

echo "Do you want to install Portainer Community Edition (CE) or Enterprise Edition (EE)?"
read -p "Enter CE or EE: " edition

# update the package index
sudo apt-get update

# install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

# add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# update the package index again
sudo apt-get update

# install Docker CE
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# add the current user to the docker group
sudo usermod -aG docker $USER

# pull the appropriate Portainer image
if [ "$edition" == "CE" ]; then
  sudo docker pull portainer/portainer
  tag="portainer/portainer"
elif [ "$edition" == "EE" ]; then
  sudo docker pull portainer/portainer-ee
  tag="portainer/portainer-ee:latest"
else
  echo "Invalid option. Exiting."
  exit 1
fi

# create a data volume for Portainer
sudo docker volume create portainer_data

# run a Portainer container
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data $tag
