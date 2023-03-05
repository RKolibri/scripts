#!/bin/bash

echo -e "\033[32mDo you want to install Portainer Community Edition (CE) or Enterprise Edition (EE)?\033[0m"
read -p "Enter CE or EE: " edition

echo -e "\033[32mUpdating the package index...\033[0m"
sudo apt-get update

echo -e "\033[32mInstalling packages to allow apt to use a repository over HTTPS...\033[0m"
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

echo -e "\033[32mAdding Docker's official GPG key...\033[0m"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo -e "\033[32mSetting up the stable repository...\033[0m"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo -e "\033[32mUpdating the package index again...\033[0m"
sudo apt-get update

echo -e "\033[32mInstalling Docker CE...\033[0m"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo -e "\033[32mAdding the current user to the docker group...\033[0m"
sudo usermod -aG docker $USER

if [ "$edition" == "CE" ]; then
  echo -e "\033[32mPulling the Portainer Community Edition image...\033[0m"
  sudo docker pull portainer/portainer-ce
  tag="portainer/portainer-ce:latest"
elif [ "$edition" == "EE" ]; then
  echo -e "\033[32mPulling the Portainer Enterprise Edition image...\033[0m"
  sudo docker pull portainer/portainer-ee
  tag="portainer/portainer-ee:latest"
else
  echo -e "\033[31mInvalid option. Exiting.\033[0m"
  exit 1
fi

echo -e "\033[32mCreating a data volume for Portainer...\033[0m"
sudo docker volume create portainer_data

echo -e "\033[32mRunning a Portainer container...\033[0m"
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data $tag
